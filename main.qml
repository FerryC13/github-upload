import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    width: 425
    height: 940
    visible: true
    title: qsTr("Scroll")

    Rectangle {
        id : welcomeBar
        width : 425
        height: 80
        color: "black"
        Rectangle {
            anchors  {
                left: welcomeBar.left
                leftMargin: 10
                topMargin: 10
            }
            id: picFrame
            radius : 500
            width: dispPic.width
            height : 60
            Image {
                height: picFrame.height
                fillMode: Image.PreserveAspectFit
                id: dispPic
                source: "qrc:/UI/Assets/Ferry_2563929.png"
            }
        }
//        Rectangle {
//            id:textBar
//            width: welcomeBar.width - picFrame.width
//            height : 60

//        }

    }

    Container {

    }

    Rectangle{
        width : parent.width
        height: 800
        anchors.top: welcomeBar.bottom
        color: "black"
        ListView {
            anchors.fill: parent
            id: listView
            width: 425
            clip: true
            model: 20
            delegate: ItemDelegate {
                text: "Item " + (index + 1)
                width: listView.width
            }
        }
    }

    //I am handsome
}
