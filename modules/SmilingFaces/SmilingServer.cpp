#include "SmilingServer.h"

#include <QDebug>
#include <QDir>
#include <QTime>

#include "SmilingInfo.h"

SmilingServer::SmilingServer(const QString& _rootDirectory, QObject *parent) :
    QObject(parent)
{
  qsrand(QTime::currentTime().msec());
  foreach(QString file, QDir(_rootDirectory + "/smiles/").entryList(QDir::Files))
  {
    m_availableSmiles.append(new SmilingInfo(true, _rootDirectory + "/smiles/" + file));
  }
  foreach(QString file, QDir(_rootDirectory + "/sullens/").entryList(QDir::Files))
  {
    m_availableSullen.append(new SmilingInfo(false, _rootDirectory + "/sullens/" + file));
  }
  qDebug() << "Found" << m_availableSmiles.size() << " smiles and " << m_availableSullen.size() << " sullens";
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
}

QList<QObject*> SmilingServer::images()
{
  return m_images;
}
