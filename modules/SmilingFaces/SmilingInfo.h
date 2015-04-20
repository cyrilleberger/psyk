#ifndef SMILINGINFO_H
#define SMILINGINFO_H

#include <QObject>

class SmilingInfo : public QObject
{
  Q_OBJECT
  Q_PROPERTY(bool smile READ smile CONSTANT);
  Q_PROPERTY(QString filename READ filename CONSTANT);
public:
  explicit SmilingInfo(bool _smile, const QString& _filename, QObject *parent = 0);
  bool smile() const;
  QString filename() const;
private:
  bool m_smile;
  QString m_filename;
};

#endif // SMILINGINFO_H
