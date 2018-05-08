import QtQuick 2.6
import QtQuick.Controls 2.1

Dialog {
    id: aboutDialog
    x: Math.round((window.width - width) / 2)
    y: Math.round(window.height / 6)
    width: Math.round(Math.min(window.width, window.height) / 3 * 2)
    visible: true
    modal: true
    focus: true
    title: "About"

    Label {
        width: aboutDialog.availableWidth
        text: "Программа показывает силу сигнала wi-fi. Зачение изменяется от 0 до 100. Чем ближе значение к 100, тем лучше сигнал."
        wrapMode: Label.Wrap
        font.pixelSize: 16
    }
}
