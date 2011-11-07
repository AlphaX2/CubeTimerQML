import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools
    orientationLock: PageOrientation.LockPortrait

    property alias stopwatchON: stopwatchSwitch.checked
    property alias inspectionON: inspectionSwitch.checked

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
        ToolIcon {
            platformIconId: "toolbar-back"
            anchors.left: (parent === undefined) ? undefined : parent.left
            onClicked: pageStack.pop()
        }
    }

    Text { // Titel der App selbst
        id: title_settings
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        text: qsTr("Settings")
        font.pointSize: 50
        style: Text.Outline
        styleColor: "#848784"
        color: "#aaaaaa"
    }

    Text {
        id: title_settings_part2
        anchors.left: title_settings.right
        anchors.leftMargin: 5
        anchors.bottom: title_settings.bottom
        text: "CubeTimer"
        font.pointSize: 30
        color: "#298ede"
    }

    CheckBox {
        id: stopwatchSwitch
        objectName: "stopwatchSwitch"
        anchors.top: parent.top
        anchors.topMargin: 250
        anchors.left: parent.left
        anchors.leftMargin: 50

        Text {
            id: stopwatchSwitchText
            anchors.left: parent.right
            anchors.leftMargin: 20
            anchors.verticalCenter: stopwatchSwitch.verticalCenter
            font.pointSize: 24
            text: "Stopwatch mode"
        }
    }

    CheckBox {
        id: inspectionSwitch
        objectName: "inspectionSwitch"
        anchors.top: stopwatchSwitch.bottom
        anchors.topMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50

        Text {
            id: inspectionSwitchText
            anchors.left: parent.right
            anchors.leftMargin: 20
            anchors.verticalCenter: stopwatchSwitch.verticalCenter
            font.pointSize: 24
            text: "Inspection time"
        }
    }

    Text {
        id: inspectionTimeText
        anchors.top: inspectionSwitch.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        font.pointSize: 24
        text: qsTr("Seconds:")
        opacity: inspectionSwitch.checked ? 1.0 : 0.0
    }

    ButtonRow {
             id: inspectiontimerow
             opacity: inspectionSwitch.checked ? 1.0 : 0.0
             checkedButton: wait15

             anchors.horizontalCenter: parent.horizontalCenter
             anchors.top: inspectionTimeText.bottom
             anchors.topMargin: 20

             Button {
                 id: wait5
                 objectName: "wait5"
                 text: qsTr("5")
             }

             Button {
                 id: wait10
                 objectName: "wait10"
                 text: qsTr("10")
             }

             Button {
                 id: wait15
                 objectName: "wait15"
                 text: qsTr("15")
             }

             Button {
                 id: wait20
                 objectName: "wait20"
                 text: qsTr("20")
             }

             Button {
                 id: wait25
                 objectName: "wait25"
                 text: qsTr("25")
             }

             Button {
                 id: wait30
                 objectName: "wait30"
                 text: qsTr("30")
             }
         }
}
