import QtQuick 2.0
import psyk 1.0
import QtQuick.Controls 1.0

Activity
{
  ExternalResource {
    id: re02
    downloadUrl: "http://www.shambhala.com/media/wysiwyg/audio_extras/02%20Mindful%20Breathing.mp3"
    localName: "mindfull/02.mp3"
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
    source: "file:///home/cyrille/.local/share/psyk/mindfull/02.mp3" // re02.localUrl
    Component.onCompleted:
    {
      console.log(re02.localUrl)
    }
  }
}
