import QtQuick 2.0

Item
{
  signal exitActivity()
  Keys.onEscapePressed: {
    exitActivity()
  }
}
