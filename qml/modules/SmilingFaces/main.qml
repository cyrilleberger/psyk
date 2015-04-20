import QtQuick 2.0
import psyk 1.0
import modules.SmilingFaces 1.0

Activity {
  id: root
  width: 360
  height: 360
  SmilingServer
  {
    id: smilingServer
    imagesCount: Math.floor(root.width / 100) * Math.floor(root.height / 100)
    onImagesCountChanged: {
      console.log(root.width / 100, root.height / 150, imagesCount)
    }
  }

  GridView
  {
    anchors.fill: parent
    model: smilingServer.images
    delegate: Image
    {
      height: 100
      fillMode: Image.PreserveAspectFit
      source: modelData.filename
      MouseArea
      {
        anchors.fill: parent
        onClicked:
        {
          if(modelData.smile)
          {
            smilingServer.updateImages()
          }
        }
      }
    }
  }
}
