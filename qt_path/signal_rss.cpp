#include <QString>
#include <QFile>
#include <QIODevice>
#include <QStringList>
#include <QDebug>
#include "signal_rss.h"

signal_rss::signal_rss(QObject *parent) : QObject(parent) {

}

QString readFile(int &size){
    QFile file("/proc/net/wireless");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
       // error message here
       return NULL;
    }
    QString str = NULL;
    do {
        str += file.readLine();
    } while( !file.atEnd() );
    file.close();
    size = str.size();
    return str;
}

QString get_rssi() {
    int size;
    QString str = readFile(size);
    QString buff = NULL;
    if(size > 162) {
        for(int i = 0; i < 3; ++i) {
            buff += str[182+i];
        }
        return "Rssi = " + buff;
    }
    else return "Wi-Fi off";

}

void signal_rss::wifi_slot() {
    QObject * textMod = this->parent()->findChild<QObject*>("textMod");
    QObject * viewMod = this->parent()->findChild<QObject*>("viewMod");
    QString str = get_rssi();
    int rssi = 100 - str.split("-")[1].toInt();
    textMod->setProperty("text", str);
    viewMod->setProperty("value", rssi);
}
