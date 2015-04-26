#include "ExternalResource.h"

#include <QDebug>
#include <QDir>
#include <QFileInfo>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QStandardPaths>

ExternalResource::ExternalResource(QObject *parent) :
  QObject(parent)
{
  connect(&m_WebCtrl, SIGNAL (finished(QNetworkReply*)), this, SLOT (fileDownloaded(QNetworkReply*)));
}

ExternalResource::~ExternalResource()
{

}

bool ExternalResource::isAvailable() const
{
  return QFileInfo(m_localUrl).exists();
}

void ExternalResource::setLocalName(const QString& _localName)
{
  m_localName = _localName;
  m_localUrl  = QStandardPaths::locate(QStandardPaths::DataLocation, m_localName);
  emit(localNameChanged());
  emit(isAvailableChanged());
  emit(localUrlChanged());
}

void ExternalResource::download()
{
  QNetworkRequest request(m_downloadUrl);
  m_WebCtrl.get(request);
}

void ExternalResource::fileDownloaded(QNetworkReply *pReply)
{
  QByteArray data = pReply->readAll();
  pReply->deleteLater();

  QString dstname = QStandardPaths::writableLocation(QStandardPaths::DataLocation) + "/" + m_localName;
  QFileInfo(dstname).absoluteDir().mkpath(".");

  QFile dst(dstname);
  dst.open(QIODevice::WriteOnly);
  dst.write(data);
  dst.close();

  m_localUrl  = QStandardPaths::locate(QStandardPaths::DataLocation, m_localName);
  emit(isAvailableChanged());
  emit(localUrlChanged());
}
