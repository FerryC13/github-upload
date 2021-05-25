import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

ApplicationWindow {
    color: "white"
    width: 425
    height: 900
    visible: true
    title: qsTr("Home page")
    ToastManager {
        id : toast
    }

    Column {
        property string tabMode: "today"
        property string niceBlue: "#5085ff"
        id: welcomeCol
        Rectangle {
            id : welcomeBar
            width : 400
            height: 55
            color: "white"

            Rectangle {
                id: picFrame
                radius : 50
                border.width: 2
                border.color: "black"
                width: 50
                height : 50
                color: "#00000000"
                anchors  {
                    left: welcomeBar.left
                    top: welcomeBar.top
                    leftMargin: 10
                    topMargin: 3
                }
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
                    spacing: 5
                    DisplayText {
                        id: welcomeText
                        text: qsTr("<b>Welcome back, Ferry!</b>")
                        font.pixelSize: 17

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
            width : welcomeBar.width - 5
            height : 33
            color : "white"

            ProgressBar {
                id : progressBar
                width: parent.width - 30
                height: 10

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
            }

            Rectangle {
                z : 1
                anchors {
                    left : progressBar.left
                    bottom: progressBar.bottom
                }
                height: progressBar.height
                width : progressBar.width*0.5
                color: welcomeCol.niceBlue
                border.color: welcomeCol.niceBlue
                radius: 10

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

    TabBar {
        id : selectionTab
        width : parent.width
        anchors {
            top: welcomeCol.bottom
        }
        background: Rectangle {
            color: "white"
        }

        TabButton {
            contentItem: DisplayText {
                color: "black"
                horizontalAlignment: "AlignHCenter"
                text: qsTr("Today")
            }
            onClicked: {
                todayModel.clear()
                todayModel.append([{ boxColour : "#5185fe" , haveSetup : true  , titleText : "<b>  Small stuff adds up! </b>" , infoText: "Last month, you made <b> 40 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#4fd3c3" , haveSetup : false , titleText : "<b> You're doing well paying off your loans </b>" , infoText: "Since this time last year, you've contributed $5.678 toward your tuition Student Loan. Great work!!"}
                                  ,{ boxColour : "#6065cf" , haveSetup : false , titleText : "<b> You're doing great today </b>" , infoText: "You managed to save up $30 since last month. Nice :)"}
                                  ,{ boxColour : "#fe84aa" , haveSetup : false , titleText : "<b> Bank is experiencing tough day, bro. </b>" , infoText: "Last month, you made <b> 43 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#4287f3" , haveSetup : true  , titleText : "<b> Great depression coming soon, be careful!! </b>" , infoText: "Last month, you made <b> 44 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#708c9f" , haveSetup : false , titleText : "<b> The item in your wishlist is coming out soon.</b>" , infoText: "Last month, you made <b> 45 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#265581" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 46 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#304878" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 47 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#8ab5ec" , haveSetup : false , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 48 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#5a6ac4" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 49 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}])
            }
           }

        TabButton {
            contentItem: DisplayText {
                color: "black"
                horizontalAlignment: "AlignHCenter"
                text: qsTr("Monthly")
            }
            onClicked: {
                todayModel.clear()
                todayModel.append([{ boxColour : "#5185fe" , haveSetup : true  , titleText : "<b> This is monthly tab, cool! </b>" , infoText: "Last month, you made <b> 40 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                 ,{ boxColour : "#4fd3c3" , haveSetup : false , titleText : "<b> You're doing well paying off your loans </b>" , infoText: "Since this time last year, you've contributed $5.678 toward your tuition Student Loan. Great work!!"}
                                 ,{ boxColour : "#6065cf" , haveSetup : false , titleText : "<b> You're doing great today </b>" , infoText: "You managed to save up $30 since last month. Nice :)"}
                                 ,{ boxColour : "#fe84aa" , haveSetup : false , titleText : "<b> Bank is experiencing tough day, bro. </b>" , infoText: "Last month, you made <b> 43 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                 ,{ boxColour : "#4287f3" , haveSetup : true  , titleText : "<b> Great depression coming soon, be careful!! </b>" , infoText: "Last month, you made <b> 44 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                 ,{ boxColour : "#708c9f" , haveSetup : false , titleText : "<b> The item in your wishlist is coming out soon.</b>" , infoText: "Last month, you made <b> 45 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                 ,{ boxColour : "#265581" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 46 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                 ,{ boxColour : "#304878" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 47 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                 ,{ boxColour : "#8ab5ec" , haveSetup : false , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 48 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                 ,{ boxColour : "#5a6ac4" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 49 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}])
            }
        }
        TabButton {
            contentItem: DisplayText {
                color: "black"
                horizontalAlignment: "AlignHCenter"
                text: qsTr("Yearly")
            }
            onClicked: {
                todayModel.clear()
                todayModel.append([{ boxColour : "#5185fe" , haveSetup : true  , titleText : "<b>  This is yearly tab, cool! </b>" , infoText: "Last month, you made <b> 40 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#4fd3c3" , haveSetup : false , titleText : "<b> You're doing well paying off your loans </b>" , infoText: "Since this time last year, you've contributed $5.678 toward your tuition Student Loan. Great work!!"}
                                  ,{ boxColour : "#6065cf" , haveSetup : false , titleText : "<b> You're doing great today </b>" , infoText: "You managed to save up $30 since last month. Nice :)"}
                                  ,{ boxColour : "#fe84aa" , haveSetup : false , titleText : "<b> Bank is experiencing tough day, bro. </b>" , infoText: "Last month, you made <b> 43 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#4287f3" , haveSetup : true  , titleText : "<b> Great depression coming soon, be careful!! </b>" , infoText: "Last month, you made <b> 44 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#708c9f" , haveSetup : false , titleText : "<b> The item in your wishlist is coming out soon.</b>" , infoText: "Last month, you made <b> 45 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#265581" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 46 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#304878" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 47 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#8ab5ec" , haveSetup : false , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 48 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#5a6ac4" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 49 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}])
            }
        }
        TabButton {
            contentItem: DisplayText {
                color: "black"
                horizontalAlignment: "AlignHCenter"
                text: qsTr("Future")
            }
            onClicked: {
                todayModel.clear()
                todayModel.append([{ boxColour : "#5185fe" , haveSetup : true  , titleText : "<b>  This is the FUTURE tab, cool! </b>" , infoText: "Last month, you made <b> 40 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#4fd3c3" , haveSetup : false , titleText : "<b> You're doing well paying off your loans </b>" , infoText: "Since this time last year, you've contributed $5.678 toward your tuition Student Loan. Great work!!"}
                                  ,{ boxColour : "#6065cf" , haveSetup : false , titleText : "<b> You're doing great today </b>" , infoText: "You managed to save up $30 since last month. Nice :)"}
                                  ,{ boxColour : "#fe84aa" , haveSetup : false , titleText : "<b> Bank is experiencing tough day, bro. </b>" , infoText: "Last month, you made <b> 43 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#4287f3" , haveSetup : true  , titleText : "<b> Great depression coming soon, be careful!! </b>" , infoText: "Last month, you made <b> 44 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#708c9f" , haveSetup : false , titleText : "<b> The item in your wishlist is coming out soon.</b>" , infoText: "Last month, you made <b> 45 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#265581" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 46 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#304878" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 47 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#8ab5ec" , haveSetup : false , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 48 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
                                  ,{ boxColour : "#5a6ac4" , haveSetup : true  , titleText : "<i> Small stuff adds up! </i>" , infoText: "Last month, you made <b> 49 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}])
            }
        }
    }

    ListModel {
        id : todayModel
        ListElement { boxColour : "#5185fe" ; haveSetup : true  ; titleText : "<b> Small stuff adds up! </b>" ; infoText: "Last month, you made <b> 40 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
        ListElement { boxColour : "#4fd3c3" ; haveSetup : false ; titleText : "<b> You're doing well paying off your loans </b>" ; infoText: "Since this time last year, you've contributed $5.678 toward your tuition Student Loan. Great work!!"}
        ListElement { boxColour : "#6065cf" ; haveSetup : false ; titleText : "<b> You're doing great today </b>" ; infoText: "You managed to save up $30 since last month. Nice :)"}
        ListElement { boxColour : "#fe84aa" ; haveSetup : false ; titleText : "<b> Bank is experiencing tough day, bro. </b>" ; infoText: "Last month, you made <b> 43 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
        ListElement { boxColour : "#4287f3" ; haveSetup : true  ; titleText : "<b> Great depression coming soon, be careful!! </b>" ; infoText: "Last month, you made <b> 44 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
        ListElement { boxColour : "#708c9f" ; haveSetup : false ; titleText : "<b> The item in your wishlist is coming out soon.</b>" ; infoText: "Last month, you made <b> 45 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
        ListElement { boxColour : "#265581" ; haveSetup : true  ; titleText : "<i> Small stuff adds up! </i>" ; infoText: "Last month, you made <b> 46 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
        ListElement { boxColour : "#304878" ; haveSetup : true  ; titleText : "<i> Small stuff adds up! </i>" ; infoText: "Last month, you made <b> 47 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
        ListElement { boxColour : "#8ab5ec" ; haveSetup : false ; titleText : "<i> Small stuff adds up! </i>" ; infoText: "Last month, you made <b> 48 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
        ListElement { boxColour : "#5a6ac4" ; haveSetup : true  ; titleText : "<i> Small stuff adds up! </i>" ; infoText: "Last month, you made <b> 49 transactions </b> less than $5, spending a total of $147. Want to cut down on frivolous spending?"}
    }

    Component {
        id : boxDelegate
        Rectangle {
            id: infoBubble
            x : 5
            y : 20 + 150*(model.index)
            color: model.boxColour
            width : listView.width - 10
            height: 150
            radius: 10
            Row {
                id: theRow
                x :3 ; y :3
                height: parent.height
                width: parent.width
                Rectangle {
                    id : logoFrame
                    color: model.boxColour
                    radius : 10
                    width: coinLogo.width + 10
                    height: 100
                    anchors {
                        topMargin: 10
                        top: theRow.top
                    }
                    Image {
                        id: coinLogo
                        x : 5
                        source: "qrc:/UI/Assets/coins.png"
                        width: 40
                        height: 40
                        fillMode: Image.PreserveAspectFit
                    }
                }
                Rectangle {
                    id: textframe
                    y : 5
                    radius : 10
                    color: model.boxColour
                    width: theRow.width - coinLogo.width -40
                    height: theRow.height - 15
                    DisplayText {
                        id: bigTitle
                        color: "white"
                        width: parent.width - 120
                        height: 40
                        horizontalAlignment: Text.AlignJustify
                        clip: true
                        text: model.titleText
                        fontSizeMode: Text.Fit
                        font.pixelSize: 16
                        wrapMode: Text.Wrap
                        minimumPixelSize: 12
                        anchors {
                            left: textframe.left
                            leftMargin: 12
                        }
                    }
                    DisplayText {
                        id : dateText
                        text: qsTr("09-06-2018")
                        opacity: 0.8
                        font.pixelSize: 12
                        color: "white"
                        anchors {
                            right : textframe.right
                            rightMargin:  10
                            baseline: bigTitle.baseline
                        }
                    }
                    DisplayText {
                        id : infoParagraph
                        width: parent.width -30
                        opacity: 0.8
                        height: 50
                        color: "white"
                        fontSizeMode: Text.Fit
                        font.pixelSize: 14
                        minimumPixelSize: 12
                        text: model.infoText
                        horizontalAlignment: Text.AlignJustify
                        wrapMode: Text.Wrap
                        anchors {
                            top: bigTitle.bottom
                            topMargin: 3
                            left: textframe.left
                            leftMargin: 10

                        }
                    }
                    Rectangle {
                        id: setupButton
                        implicitWidth: model.haveSetup ? buttonText.implicitWidth + 15 : 0
                        implicitHeight: model.haveSetup ? buttonText.implicitHeight + 15 : 0
                        radius: 50
                        clip: true
                        anchors {
                            top: infoParagraph.bottom
                            topMargin: 5
                            left: textframe.left
                            leftMargin: 10
                        }
                        DisplayText {
                            id: buttonText
                            color: model.boxColour
                            text: qsTr("<b>SETUP A GOAL</b>")
                            font.pixelSize: 10
                            anchors.centerIn: parent
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: toast.show("Setting starts")
                        }
                    }
                    Image {
                        property bool liked: false
                        id: heartLogo
                        smooth: true
                        opacity: 1
                        source: "qrc:/UI/Assets/heart-4-512.png"
                        width: coinLogo.width - 15
                        height: coinLogo.height - 15
                        fillMode: Image.PreserveAspectFit
                        scale: 1
                        anchors {
                            right: textframe.right
                            rightMargin:  10
                            baseline: setupButton.baseline
                        }
                        MouseArea {
                            anchors.fill : parent
                            onClicked : {
                                anim1.to = (heartLogo.opacity == 1) ? 0 : 1
                                anim1.running = true
                                anim2.to = (heartFilledLogo.opacity == 0) ? 1 : 0
                                anim2.running = true
                            }
                        }
                    }
                    NumberAnimation {
                        id : anim1
                        target: heartLogo
                        property: "opacity";
                        easing.type: Easing.InOutQuad;
                        duration: 500  }
                    Image {
                        id: heartFilledLogo
                        source: "qrc:/UI/Assets/heart.png"
                        smooth: true
                        opacity: 0
                        anchors.fill: heartLogo
                    }
                    NumberAnimation{
                        id : anim2
                        target: heartFilledLogo
                        property: "opacity";
                        easing.type: Easing.Linear;
                        duration: 500
                    }
                }
            }
        }
    }

    Rectangle{
        id : listStuff
        width : parent.width
        height: 650
        anchors.top: selectionTab.bottom
        anchors.topMargin: 10
        color: "white"
        ScrollView{
            width: parent.width
            height: parent.height
            clip: true
            contentWidth: availableWidth
            ListView {
                id: listView
                spacing: 10
                anchors.fill: parent
                model: todayModel
                clip: true
                delegate: boxDelegate
                populate: Transition {
                    NumberAnimation {
                        properties: "x,y" ; duration: 300
                    }
                }
                add: Transition {
                   NumberAnimation { property: "opacity"; easing.type: Easing.InOutQuad; from: 0; to: 1.0; duration: 250 }
                }

                remove: Transition {
                    NumberAnimation { property: "opacity"; easing.type: Easing.InOutCubic; from: 1.0; to: 0; duration: 250 }

                }
            }
        }

    }
}


