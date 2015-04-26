import QtQuick 2.0
import psyk 1.0
import modules.Mindfull 1.0 as Mindfull

Activity
{
  id: root
  state: "menu"
  Menu
  {
    id: menu
    anchors.fill: parent
    visible: false
    entries: ListModel
    {
      ListElement { label: "Breathing"; name: "breathing" }
      ListElement { label: "Sound,\nBreath,\nand Body"; name: "sbb" }
      ListElement { label: "Body Scan"; name: "bodyscan" }
      ListElement { label: "Mindful Walking"; name: "mindfulWalking" }
      ListElement { label: "Mind Like a Sky"; name: "mindLikeSky" }
      ListElement { label: "RAIN"; name: "rain" }
      ListElement { label: "Loving Kindness"; name: "lovingKindness" }
      ListElement { label: "Mindful Presence"; name: "mindfulPresence" }
    }
    onMenuEntryClicked: root.state = value
  }
  Mindfull.Meditation
  {
    id: breathing
    anchors.fill: parent
    visible: false
    downloadUrl: "http://www.shambhala.com/media/wysiwyg/audio_extras/02%20Mindful%20Breathing.mp3"
    localName: "mindfull/02.mp3"
    onExitActivity: root.state = "menu"
  }
  Mindfull.Meditation
  {
    id: sbb
    anchors.fill: parent
    visible: false
    downloadUrl: "http://www.shambhala.com/media/wysiwyg/audio_extras/03%20Sound,%20Breath,%20and%20Body.mp3"
    localName: "mindfull/03.mp3"
    onExitActivity: root.state = "menu"
  }
  Mindfull.Meditation
  {
    id: bodyscan
    anchors.fill: parent
    visible: false
    downloadUrl: "http://www.shambhala.com/media/wysiwyg/audio_extras/04%20Body%20Scan.mp3"
    localName: "mindfull/04.mp3"
    onExitActivity: root.state = "menu"
  }
  Mindfull.Meditation
  {
    id: mindfulWalking
    anchors.fill: parent
    visible: false
    downloadUrl: "http://www.shambhala.com/media/wysiwyg/audio_extras/05%20Mindful%20Walking.mp3"
    localName: "mindfull/05.mp3"
    onExitActivity: root.state = "menu"
  }
  Mindfull.Meditation
  {
    id: mindLikeSky
    anchors.fill: parent
    visible: false
    downloadUrl: "http://www.shambhala.com/media/wysiwyg/audio_extras/06%20Mind%20Like%20a%20Sky.mp3"
    localName: "mindfull/06.mp3"
    onExitActivity: root.state = "menu"
  }
  Mindfull.Meditation
  {
    id: rain
    anchors.fill: parent
    visible: false
    downloadUrl: "http://www.shambhala.com/media/wysiwyg/audio_extras/07%20RAIN.mp3"
    localName: "mindfull/07.mp3"
    onExitActivity: root.state = "menu"
  }
  Mindfull.Meditation
  {
    id: lovingKindness
    anchors.fill: parent
    visible: false
    downloadUrl: "http://www.shambhala.com/media/wysiwyg/audio_extras/08%20Loving%20Kindness.mp3"
    localName: "mindfull/08.mp3"
    onExitActivity: root.state = "menu"
  }
  Mindfull.Meditation
  {
    id: mindfulPresence
    anchors.fill: parent
    visible: false
    downloadUrl: "http://www.shambhala.com/media/wysiwyg/audio_extras/09%20Mindful%20Presence.mp3"
    localName: "mindfull/09.mp3"
    onExitActivity: root.state = "menu"
  }

  states: [
    State {
      name: "menu"
      PropertyChanges { target: menu; visible: true; focus: true }
    },
    State {
      name: "breathing"
      PropertyChanges { target: breathing; visible: true; focus: true }
    },
    State {
      name: "sbb"
      PropertyChanges { target: sbb; visible: true; focus: true }
    },
    State {
      name: "bodyscan"
      PropertyChanges { target: bodyscan; visible: true; focus: true }
    },
    State {
      name: "mindfulWalking"
      PropertyChanges { target: mindfulWalking; visible: true; focus: true }
    },
    State {
      name: "mindLikeSky"
      PropertyChanges { target: mindLikeSky; visible: true; focus: true }
    },
    State {
      name: "rain"
      PropertyChanges { target: rain; visible: true; focus: true }
    },
    State {
      name: "lovingKindness"
      PropertyChanges { target: lovingKindness; visible: true; focus: true }
    },
    State {
      name: "mindfulPresence"
      PropertyChanges { target: mindfulPresence; visible: true; focus: true }
    }

  ]
}
