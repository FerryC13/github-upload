import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

ApplicationWindow {
    width: 425
    height: 940
    visible: true
    title: qsTr("Home page")

    Column {
        property string niceBlue: "#5085ff"
        id: welcomeCol
        Rectangle {
            id : welcomeBar
            width : 425
            height: 55
            color: "white"

            Rectangle {
                anchors  {
                    left: welcomeBar.left
                    top: welcomeBar.top
                    leftMargin: 10
                    topMargin: 3
                }
                id: picFrame
                radius : 50
                border.width: 2
                border.color: "black"
                width: 50
                height : 50
                color: "#00000000"

                Image {
                    z :-1
                    property bool rounded: true
                    property bool adapt: true
                    id: dispPic
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/UI/Assets/Ferry_2563929.png"
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    layer.enabled: rounded
                    layer.effect: OpacityMask {
                        maskSource: Item {
                            width: dispPic.width
                            height: dispPic.height
                            Rectangle {
                                border {
                                    color: "black"
                                }
                                anchors.centerIn: parent
                                width: dispPic.adapt ? dispPic.width : Math.min(dispPic.width, dispPic.height)
                                height: dispPic.adapt ? dispPic.height : width
                                radius: Math.min(width, height)
                            }
                        }
                    }
                }
            }
            Rectangle {
                id:textBar
                width: welcomeBar.width - picFrame.width - dot3icon.width - 40
                height : 50
                anchors {
                    left: picFrame.right
                    top: welcomeBar.top
                    leftMargin: 10
                    topMargin: 5
                }
                Column {
                    DisplayText {
                        id: welcomeText
                        text: qsTr("Welcome back, Ferry!")
                        font.pixelSize: 20

                    }
                    DisplayText  {
                        id: statusText
                        y: 24
                        text: qsTr("Your financial situation is looking good this time!")
                        font.pixelSize: 10
                        color: "grey"
                    }
                }

            }
            Image {
                id: dot3icon
                width: 15
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
        Rectangle {
            id : progressBox
            width : welcomeBar.width
            height : 33
            color : "white"

            ProgressBar {
                id : progressBar
                width: parent.width - 30
                height: 10
                value : 0.5
                anchors {
                    horizontalCenter: progressBox.horizontalCenter
                    top: progressBox.top
                    topMargin: 3
                }
                background: Rectangle {
                    anchors.fill: progressBar
                    radius: 10
                    color: "lightblue"
                    opacity: 0.5

                }
                contentItem: Rectangle {
                    anchors.left: progressBar.left
                    anchors.bottom: progressBar.bottom
                    height: progressBar.height
                    width: (progressBar.width * 0.5)
                    color: welcomeCol.niceBlue
                    border.color: welcomeCol.niceBlue
                    radius: 10
                }
            }
            DisplayText {
                id : levelStatus
                font.pixelSize: 10
                color: "grey"
                text: qsTr("Beginner Level")
                anchors {
                    left: progressBox.left
                    leftMargin: 16
                    top: progressBar.bottom
                }
            }
            DisplayText {
                id : experienceRatio
                font.pixelSize: 10
                color: "black"
                text: qsTr("XP 250/500")
                anchors {
                    top: progressBar.bottom
                    right: progressBox.right
                    rightMargin: 16
                }
            }

        }
    }


    Rectangle{
        id : listStuff
        width : parent.width
        height: 850
        anchors.top: welcomeCol.bottom
        anchors.topMargin: 10
        color: "black"

        ListView {
            id: listView
            spacing: 10
            anchors.fill: parent
            model: 6
            clip: true
            delegate:
                Rectangle {
                id: infoBubble
                x : 5
                y : 5 + 150*listView.model
                color: welcomeCol.niceBlue
                width : listView.width - 10
                height: 150
                radius: 10
                border {
                    color: "black"
                    width: 3
                }

                Row {
                    id: theRow
                    x :3 ; y :3
                    height: parent.height
                    width: parent.width
                    Rectangle {
                        id : logoFrame
                        color: welcomeCol.niceBlue
                        radius : 10
                        width: coinLogo.width
                        height: 100
                        anchors {
                            topMargin: 10
                            top: theRow.top
                        }
                        Image {
                            id: coinLogo
                            x : 5
                            source: "qrc:/UI/Assets/Coins_3946198.png"
                            width: 40
                            height: 40
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                    Rectangle { id: textframe
                         y : 5
                        radius : 10
                        color: welcomeCol.niceBlue
                        width: theRow.width - coinLogo.width -10
                        height: theRow.height - 15
                        DisplayText {
                            id: bigTitle
                            text: qsTr("Small stuff adds up!")
                            font.pixelSize: 20
                            anchors {
                                left: textframe.left
                                leftMargin: 10
                            }
                        }
                        DisplayText {
                            id : dateText
                            text: qsTr("09-06-2018")
                            font.pixelSize: 12
                            anchors {
                                right : textframe.right
                                rightMargin:  10
                                baseline: bigTitle.baseline
                            }
                        }
                        DisplayText {
                            id : infoParagraph
                            width: parent.width -30
                            height: parent.height - textframe.height - 10
                            fontSizeMode: Text.Fit
                            font.pixelSize: 15
                            minimumPixelSize: 12
                            text: "Last month, you made <b> 42 transactions </b>
                                   less than $5, spending a total of $147.
                                   Want to cut down on frivolous spending?"
                            horizontalAlignment: Text.AlignJustify
                            wrapMode: Text.Wrap
                            anchors {
                                top: bigTitle.bottom
                                topMargin: 10
                                left: textframe.left
                                leftMargin: 10

                            }
                        }


                    }
                }
            }
        }

    }
}

//I am handsome

