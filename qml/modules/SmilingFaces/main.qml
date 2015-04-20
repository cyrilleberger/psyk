import QtQuick 2.0
import psyk 1.0

Activity {
    width: 360
    height: 360
    GridView {
        anchors.fill: parent
    
        model:[] // app_smiling_server.images
        delegate: Image {
          height: 100
          fillMode: Image.PreserveAspectFit
          source: modelData.filename
          MouseArea {
            anchors.fill: parent
            onClicked: {
              if(modelData.smile)
              {
                app_smiling_server.updateImages()
              }
            }
          }
        }
    }
}
