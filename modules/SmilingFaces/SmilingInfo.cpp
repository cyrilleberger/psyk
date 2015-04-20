#include "SmilingInfo.h"

SmilingInfo::SmilingInfo(bool _smile, const QString& _filename, QObject *parent) :
  QObject(parent), m_smile(_smile), m_filename(_filename)
{
}

bool SmilingInfo::smile() const
{
  return m_smile;
}

QString SmilingInfo::filename() const
{
  return m_filename;
}
