import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.0
import QtMultimedia 5.0

Item
{
  id: root
  property alias source:      player.source
  property alias sourceRect:  videoOutput.sourceRect
  property alias muted:       player.muted

  onVisibleChanged: {
    player.play()
  }

  MediaPlayer
  {
    id: player
    autoPlay: false
    onPositionChanged:
    {
      controlPositionSlider.enable_seeking = false
      controlPositionSlider.value = position
      controlPositionSlider.enable_seeking = true
    }
  }
  width: sourceRect.width
  height: sourceRect.height
  VideoOutput
  {
    id: videoOutput
    source: player
    anchors.fill: parent
  }
  MouseArea
  {
    anchors.fill: parent
    hoverEnabled: true
    onPositionChanged:
    {
      control.heightFactor = 1
      hideControl.restart()
    }
  }

  Rectangle
  {
    id: control
    color: "black"
    height: (player.hasVideo ? heightFactor : 1) * 20
    clip: true
    width: root.width
    anchors.bottom: root.bottom
    property real heightFactor: 0
    Row
    {
      id: controlButtonsRow
      Button {
        iconName: (player.playbackState === MediaPlayer.PlayingState ) ? "media-playback-pause.png" : "media-playback-start.png"
        width: height
        height: control.height
        onClicked: {
          if(player.playbackState === MediaPlayer.PlayingState)
          {
            player.pause()
          } else {
            player.play()
          }
        }
      }
      Button {
        iconName: "media-playback-stop.png"
        enabled: player.playbackState != MediaPlayer.StoppedState
        width: height
        height: control.height
        onClicked: {
          player.stop()
        }
      }
      Button {
        iconName: "player-volume-muted.png"
        width: height
        height: control.height
        checkable: true
        checked: player.muted
        onClicked:
        {
          player.muted = !player.muted
        }
      }
    }
    Slider
    {
      id: controlPositionSlider
      anchors.left: controlButtonsRow.right
      anchors.right: control.right
      maximumValue: player.duration
      enabled: player.seekable
      property bool enable_seeking: true

      onValueChanged:
      {
        if(enable_seeking)
        {
          hideControl.restart()
          player.seek(value)
        }
      }
    }

    Behavior on height
    {
      NumberAnimation
      {
       duration: 100
      }
    }
  }
  Timer
  {
    id: hideControl
    interval: 1000
    onTriggered:
    {
      if(player.hasVideo)
      {
        control.heightFactor = 1
      }
    }
  }

  onWidthChanged:
  {
    if(width != sourceRect.width)
    {
      height = Qt.binding(function() { return videoOutput.sourceRect.height * width / videoOutput.sourceRect.width } )
    }
  }
}
