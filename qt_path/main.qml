import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4

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
                    text: qsTr(" RUN >")
                    onClicked: {
                        viewMod.visible = "true"
                        qmlSignal()
                    }
                }
        }
    }

    ViewMod {
        id: viewMod
        objectName: "viewMod"
        visible: false
    }
    TextMod {
        id: textMod
        objectName: "textMod"
        visible: true
    }
}
