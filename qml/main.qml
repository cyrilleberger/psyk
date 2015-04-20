import QtQuick 2.3
import QtQuick.Controls 1.2
import psyk 1.0 as Psyk
import modules.SmilingFaces 1.0 as SmilingFaces
import modules.Mindfull 1.0 as Mindfull

ApplicationWindow
{
  visible: true
  width: 640
  height: 480

  Rectangle
  {
    id: rootRectangle
    anchors.fill: parent
    state: "menu"
    color: "black"
    Psyk.Menu
    {
      id: menu
      anchors.fill: parent
      visible: false
      entries: ListModel
      {
        ListElement { label: "Mindfull"; name: "mindfull" }
        ListElement { label: "SmilingFaces"; name: "smilingFaces" }
      }
      onMenuEntryClicked: rootRectangle.state = value
    }
    SmilingFaces.Main
    {
      id: smilingFaces
      anchors.fill: parent
      visible: false
      onExitActivity: rootRectangle.state = "menu"
    }
    Mindfull.Main
    {
      id: mindfullMain
      anchors.fill: parent
      visible: false
      onExitActivity: rootRectangle.state = "menu"
    }

    states: [
      State {
        name: "menu"
        PropertyChanges { target: menu; visible: true; focus: true }
      },
      State {
        name: "smilingFaces"
        PropertyChanges { target: smilingFaces; visible: true; focus: true }
      },
      State {
        name: "mindfull"
        PropertyChanges { target: mindfullMain; visible: true; focus: true }
      }

    ]
  }
}
