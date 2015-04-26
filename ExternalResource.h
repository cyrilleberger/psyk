#ifndef EXTERNALRESOURCE_H
#define EXTERNALRESOURCE_H

#include <QNetworkAccessManager>
#include <QObject>
#include <QUrl>

class ExternalResource : public QObject
{
  Q_OBJECT
  Q_PROPERTY(QUrl downloadUrl READ downloadUrl WRITE setDownloadUrl NOTIFY downloadUrlChanged)
  Q_PROPERTY(QString localName READ localName WRITE setLocalName NOTIFY localNameChanged)
  Q_PROPERTY(QString localUrl READ localUrl NOTIFY localUrlChanged)
  Q_PROPERTY(bool isAvailable READ isAvailable NOTIFY isAvailableChanged)
public:
  explicit ExternalResource(QObject *parent = 0);
  ~ExternalResource();
public:
  QUrl downloadUrl() const { return m_downloadUrl; }
  void setDownloadUrl(const QUrl& _url) { m_downloadUrl = _url; emit(downloadUrlChanged()); }
  QString localName() const { return m_localName; }
  void setLocalName(const QString& _localName);
  bool isAvailable() const;
  QString localUrl() const { return m_localUrl; }
  Q_INVOKABLE void download();
signals:
  void completed();
  void downloadUrlChanged();
  void localNameChanged();
  void localUrlChanged();
  void isAvailableChanged();
private slots:
 void fileDownloaded(QNetworkReply* pReply);
private:
  QNetworkAccessManager m_WebCtrl;
  QUrl m_downloadUrl;
  QString m_localName, m_localUrl;
};

#endif // EXTERNALRESOURCE_H
