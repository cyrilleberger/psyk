#include "SmilingServer.h"

#include <QDebug>
#include <QDir>
#include <QStandardPaths>
#include <QTime>

#include "SmilingInfo.h"

SmilingServer::SmilingServer(QObject *parent) :
    QObject(parent), m_imagesCount(2)
{
  QStringList smiles  = QStandardPaths::locateAll(QStandardPaths::DataLocation, "SmilingFaces/smiles", QStandardPaths::LocateDirectory);
  QStringList sullens = QStandardPaths::locateAll(QStandardPaths::DataLocation, "SmilingFaces/sullens", QStandardPaths::LocateDirectory);

  foreach(const QString& d, smiles)
  {
    loadSmiles(d);
  }
  foreach(const QString& d, sullens)
  {
    loadSullen(d);
  }

  qsrand(QTime::currentTime().msec());
  qDebug() << "Found" << m_availableSmiles.size() << " smiles and " << m_availableSullen.size() << " sullens";

  updateImages();
}

namespace
{
  template<typename _T_>
  _T_ randomFrom(const QList<_T_>& _list)
  {
    int idx = qrand() % _list.size();
    return _list[idx];
  }
}

void SmilingServer::updateImages()
{
  if(m_availableSmiles.isEmpty() or m_availableSullen.isEmpty()) return;
  QList<QObject*> newimages;
  newimages.append(randomFrom(m_availableSmiles));
  
  for(int i = 1; i < m_imagesCount; ++i)
  {
    QObject* obj = 0;
    do {
      obj = randomFrom(m_availableSullen);
    } while(newimages.contains(obj));
    newimages.append(obj);
  }
  
  m_images.clear();
  while(not newimages.isEmpty())
  {
    int idx = qrand() % newimages.size();
    QObject* value = newimages.takeAt(idx);
    m_images.append(value);
  }
  emit(imagesChanged());
}

int SmilingServer::imagesCount()
{
  return m_imagesCount;
}

void SmilingServer::setImagesCount(int _count)
{
  m_imagesCount = _count;
  emit(imagesCountChanged());
  updateImages();
}

QList<QObject*> SmilingServer::images()
{
  return m_images;
}

void SmilingServer::loadSmiles(const QString& _dir)
{
  foreach(QString file, QDir(_dir).entryList(QDir::Files))
  {
    m_availableSmiles.append(new SmilingInfo(true, "file:///" + _dir + "/" + file));
  }
}

void SmilingServer::loadSullen(const QString& _dir)
{
  foreach(QString file, QDir(_dir).entryList(QDir::Files))
  {
    m_availableSullen.append(new SmilingInfo(false, "file:///" + _dir + "/" + file));
  }
}
