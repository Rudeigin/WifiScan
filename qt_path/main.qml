import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1

ApplicationWindow {
    id: window
    visible: true
    width: 480
    height: 640
    color: "white"
    title: qsTr("Wi-Fi signal")

    Drawer {
        id: drawer
        width: Math.min(window.width, window.height)/2
        height: window.height
        dragMargin: stackView.depth > 1 ? 0 : undefined


        ListView {
            id: listView
            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }
            model: ListModel {
                ListElement { title: "TextMod"; source: "qrc:/TextMod.qml" }
                ListElement { title: "ViewMod"; source: "qrc:/ViewMod.qml" }
                //ListElement { title: "About"; source: "qrc:/AboutMod.qml" }
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }


    header: ToolBar {
        //Material.color: "grey"
        Material.foreground: "black"
        RowLayout {
                anchors.fill: parent

                ToolButton {
                    text: qsTr("‹")
                    onClicked: stackView.pop()
                }
                Label {
                    text: "Hi"
                    elide: Label.ElideRight
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                }
                ToolButton {
                    text: qsTr("⋮")
                    onClicked: drawer.open()
                }
            }
    }
    StackView {
            id: stackView
            anchors.fill: parent
            initialItem: Label {
                text: "Выберете в меню нужный режим."
                anchors.margins: 20
//                anchors.top: logo.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                wrapMode: Label.Wrap
            }
    }
}
