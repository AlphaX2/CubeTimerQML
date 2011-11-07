import QtQuick 1.1
import QtMobility.systeminfo 1.2
import com.nokia.meego 1.0

Page {
    tools: commonTools
    orientationLock: PageOrientation.LockPortrait

    //Property Alias' für Text-Aktualisierungen
    property alias scrambletext: scramble.text
    property alias scramble2text: scramble2.text
    property alias timertext: timer.text
    property alias recordtext: record.text
    property alias averagetext: average.text
    property alias lasttext: last.text

    ScreenSaver {
        id: screenSaver
        screenSaverInhibited: false
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
        ToolIcon {
            objectName: "refreshbutton"
            platformIconId: "toolbar-refresh"
            anchors.left: (parent === undefined) ? undefined : parent.left
            onClicked: console.log("Refresh Klick")
        }
    }

    Text { // Uhrzeit der Stopuhr
        id: timer
        objectName: "timer"
        anchors.centerIn: parent
        text: "00:00:00"
        color: "#aaaaaa"
        font.pointSize: 85
        z:1
    }

    Rectangle { // connected mit Python - Start/Stop-"Button" der Uhr (unsichtbar)
        id: startstop
        anchors.centerIn: parent
        width: parent.width-20
        height: 220
        radius: 25
        color: "white"
        border.width: 2
        border.color: "#aaaaaa"

        MouseArea {
            id: timer_start
            objectName: "timer_start"
            anchors.fill: parent
            onReleased: {
                if (timer.color == "#5ab500"){timer.color = "#aaaaaa"; screenSaver.screenSaverInhibited = false}
                else {timer.color = "#5ab500"; screenSaver.screenSaverInhibited = true};
            }
        }
    }

    Text { // Titel der App selbst
        id: title
        anchors {left: parent.left; leftMargin: 10; top: parent.top; topMargin: 10}
        text: "CubeTimer"
        style: Text.Outline
        styleColor: "#848784"
        font.pointSize: 50
        color: "#aaaaaa"
    }

    Text {// Titel Zusatz QML - in blau wie Slider #298ede
        id: titel_qml
        anchors { left: title.right; leftMargin: 5; bottom: title.bottom }
        text: "QML"
        font.pointSize: 30
        color: "#298ede"
    }

    Text { // "Scramble:" Text
        id: scramble_title
        anchors {left: parent.left; leftMargin: 10; top: parent.top; topMargin: 130}
        text: qsTr("Scramble:")
        color: "#aaaaaa"
        font.pointSize: 24
        opacity: settingsPage.stopwatchON ? 0.0 : 1.0

    }

    Text { // Reihe 1 der Scramble Anweisungen
        id: scramble
        anchors {horizontalCenter: parent.horizontalCenter; anchors.top: scramble_title.bottom; anchors.topMargin: 5}
        text: " "
        font.pointSize: 14
        opacity: settingsPage.stopwatchON ? 0.0 : 1.0
    }

    Text { // Reihe 2 der Scramble Anweisungen
        id: scramble2
        anchors {horizontalCenter: parent.horizontalCenter; anchors.top: scramble.bottom; anchors.topMargin: 5}
        text: " "
        font.pointSize: 14
        opacity: settingsPage.stopwatchON ? 0.0 : 1.0
    }

    Text { // Rekord-Zeit
        id: record
        objectName: "record"
        anchors {top: startstop.bottom; anchors.topMargin: 30}
        x: 20
        text: qsTr("best: 00:06:94 min.")
        color: "black"
        font {pointSize: 18; bold: true}
        opacity: settingsPage.stopwatchON ? 0.0 : 1.0
    }

    Text { // durchschnittliche Zeit
        id: average
        objectName: "average"
        anchors {top: record.bottom; topMargin: 20}
        x: 20
        text: qsTr("average: 00:17:57 min.")
        color: "#848784"
        font {pointSize: 18; bold: true}
        opacity: settingsPage.stopwatchON ? 0.0 : 1.0
    }

    Text { // letzte Zeit
        id: last
        objectName: "last"
        anchors {top: average.bottom; topMargin: 20}
        x: 20
        text: qsTr("last: 00:26:00 min.")
        font {pointSize: 18; bold: true}
        color: "darkgrey"
        opacity: settingsPage.stopwatchON ? 0.0 : 1.0
    }
}


