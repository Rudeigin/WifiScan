import QtQuick 2.2
import QtQuick.Extras 1.4

Gauge {
    height: Math.round((window.height)/4*3)
    minimumValue: 0
    maximumValue: 100
    value: 50
}
