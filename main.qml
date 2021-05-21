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
        color: "white"
        Rectangle {
            anchors  {
                left: welcomeBar.left
                top: welcomeBar.top
                leftMargin: 10
                topMargin: 10
            }
            id: picFrame
            radius : 50
            border {
                color: "black"
                width: 3
            }
            width: dispPic.width
            height : 60
            Image {
                id: dispPic
                height: picFrame.height
                fillMode: Image.PreserveAspectFit
                source: "qrc:/UI/Assets/Ferry_2563929.png"
                clip: true
            }
        }
        Rectangle {
            id:textBar
            width: welcomeBar.width - picFrame.width - dot3icon.width - 40
            height : 60
            anchors {
                left: picFrame.right
                top: welcomeBar.top
                leftMargin: 10
                topMargin: 10
            }
            Column {
                spacing : 5
                DisplayText {
                    id: welcomeText
                    text: qsTr("Welcome back, Ferry!")
                    font.pixelSize: 16
                }
                DisplayText  {
                    id: statusText
                    text: qsTr("Your financial situation is looking good this time!")
                    font.pixelSize: 10
                    color: "grey"
                }
            }

        }
        Image {
            id: dot3icon
            width: 20
            fillMode: Image.PreserveAspectFit
            transformOrigin: Item.Center
            rotation: 90
            source: "qrc:/UI/Assets/Detail_3266022.png"
            anchors {
                left: textBar.right
                top:  welcomeBar.top
                leftMargin: 10
                topMargin: 5
            }
        }
    }

    Container {

    }

    Rectangle{
        id : listStuff
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
