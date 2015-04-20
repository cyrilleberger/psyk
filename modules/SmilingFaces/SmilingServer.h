#ifndef SMILINGSERVER_H
#define SMILINGSERVER_H

#include <QObject>

class SmilingInfo;

class SmilingServer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int imagesCount READ imagesCount WRITE setImagesCount NOTIFY imagesCountChanged);
    Q_PROPERTY(QList<QObject*> images READ images NOTIFY imagesChanged);
public:
    explicit SmilingServer(const QString& _rootDirectory, QObject *parent = 0);
    
public:
  Q_INVOKABLE void updateImages();
public:
  int imagesCount();
  void setImagesCount(int _count);
  QList<QObject*> images();
signals:
  void imagesChanged();
  void imagesCountChanged();
public slots:
private:
  int m_imagesCount;
  QList<QObject*> m_images;
  QList<SmilingInfo*> m_availableSmiles, m_availableSullen;
};

#endif // SMILINGSERVER_H
