import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Dialogs 1.2
import QtQuick.Extras 1.4

ApplicationWindow {
    id: window
    visible: true
    width: 480
    height: 640
    color: "white"
    title: qsTr("Wi-Fi signal")
    signal qmlSignal()

    header: ToolBar {
        height: 60
        RowLayout {
                anchors.fill: parent

                Label {
                    text: "Hi"
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                }
                ToolButton {
                    height: 60
                    text: qsTr(" ? ")
                    onClicked: {
                        dialog.open()
                    }
                }
        }
    }

    Gauge {
        id: viewMod
        objectName: "viewMod"
        height: Math.round((window.height)/4*3)
        minimumValue: 0
        maximumValue: 100
        value: 50
    }
    Label {
        id: textMod
        objectName: "textMod"
        width: parent.width
        font.pointSize: 14
        wrapMode: Label.Wrap
        horizontalAlignment: Qt.AlignHCenter
        text: "Start"
    }

    Dialog {
        id: dialog
        title: "F.A.Q"
        Label {
            text: qsTr("RSSI - received signal strength indicator. \nRSSI changes from 0 to 100 dB, 100 dB is the best. \nVot tak vot")
            anchors.centerIn: parent
        }
        standardButtons: StandardButton.Ok
    }
}
