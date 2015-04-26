import QtQuick 2.0
import psyk 1.0
import QtQuick.Controls 1.0

Activity
{
  property alias downloadUrl: re02.downloadUrl
  property alias localName: re02.localName
  ExternalResource {
    id: re02
  }
  Row {
    visible: !re02.isAvailable
    Text
    {
      color: "white"
      text: "unavailable"
    }
    Button {
      text: "Download"
      onClicked: {
        enabled = false
        re02.download()
      }
    }
  }
  Player
  {
    anchors.fill: parent
    visible: re02.isAvailable
    source: "file://" + re02.localUrl
  }
}
