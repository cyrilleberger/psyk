import QtQuick 2.0
import psyk 1.0

Activity
{
  id: root
  property alias entries: menu.model
  signal menuEntryClicked(string value)
  Flow
  {
    anchors.fill: parent
    anchors.margins: 5
    spacing: 5
    Repeater
    {
      id: menu
      delegate: Rectangle
      {
        width: 100
        height: 100
        color: "#333"
        Text
        {
          anchors.centerIn: parent
          text: label
          color: "white"
        }
        MouseArea
        {
          anchors.fill: parent
          onClicked: root.menuEntryClicked(name)
        }
      }
    }
  }
}
