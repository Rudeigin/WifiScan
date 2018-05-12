import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
//import QtQuick.Controls.Material 2.1

ApplicationWindow {
    id: window
    visible: true
    width: 480
    height: 640
    color: "white"
    title: qsTr("Wi-Fi signal")
    signal qmlSignal()

    header: ToolBar {
        //Material.color: "grey"
        //Material.foreground: "black"
        RowLayout {
                anchors.fill: parent

//                ToolButton {
//                    text: qsTr("?")
//                    onClicked: {
//                        about.visible = "true"
////                        viewMod.visible = "false" //why don't work?!
//                    }
//                }
                Label {
                    text: "Hi"
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                }
                ToolButton {
                    text: qsTr(">")
                    onClicked: {
                        viewMod.visible = "true"
                        qmlSignal()
//                        about.visible = "false"
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

//    Dialog {
//        TextEdit {
//            id: about
//            visible: false
//            width: parent.width
//            text: "Программа показывает силу сигнала wi-fi. \n Зачение изменяется от 0 до 100. \nЧем ближе значение к 100, тем лучше сигнал."
//            wrapMode: TextEdit.Wrap
//            font.pixelSize: 16
//        }
//    }
}
