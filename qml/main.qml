import QtQuick 1.1
import QtMobility.systeminfo 1.2
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow
    initialPage: mainPage

    //---some functions for updating all important parts from python---

    // Update des Textstrings,für die Scramble-Anweisung-Zeile 1
    function scrambler(str) {
            mainPage.scrambletext = str
    }

    // Update des Textstrings,für die Scramble-Anweisung-Zeile 2
    function scrambler2(str) {
            mainPage.scramble2text = str
    }

    // Update der Uhr-Anzeige
    function timerUpdate(str) {
            mainPage.timertext = str
    }

    // Update der Record-Zeit
    function record_time(str) {
            mainPage.recordtext = str
    }

    // Update der Average-Zeit
    function average_time(str) {
            mainPage.averagetext = str
    }

    // Update der Last-Zeit
    function last_time(str) {
            mainPage.lasttext = str
    }

    //Stopwatch Modus aus Python heraus einschalten, entsprechend der geladenen Settings:
    function activateStopwatchMode(str){
        if(str == "True"){settingsPage.stopwatchON = true}
        else {settingsPage.stopwatchON = false}
    }

    //Inspection Modus aus Python heraus einschalten, entsprechend der geladenen Settings:
    function activateInspectionMode(str){
        if(str == "True"){settingsPage.inspectionON = true}
        else {settingsPage.inspectionON = false}
        }

    MainPage {
        id: mainPage

    }

    SettingsPage {
        id: settingsPage
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { objectName: "reset_button"; text: qsTr("Reset data") }
            MenuItem { text: qsTr("Settings"); onClicked: pageStack.push(settingsPage)}
        }
    }
    }
