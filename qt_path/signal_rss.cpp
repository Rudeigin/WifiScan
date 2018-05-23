#include "signal_rss.h"

#ifdef Q_OS_ANDROID
    #include <QtAndroid>
    #include <QtAndroidExtras/QAndroidJniObject>
#elif defined Q_OS_LINUX
    #include <QFile>
    #include <QIODevice>
    #include <QStringList>
#endif

signal_rss::signal_rss(QObject *parent) : QObject(parent) {

}

void signal_rss::wifi_slot() {
    QObject * textMod = this->parent()->findChild<QObject*>("textMod");
    QObject * viewMod = this->parent()->findChild<QObject*>("viewMod");
    QString str;
    int rssi = get_rssi();
    if(rssi == -100) str = "Error or no signal.";
    else             str = "Signal: " + QString::number(rssi) + "/100";
    textMod->setProperty("text", str);
    viewMod->setProperty("value", rssi);
}

int get_rssi() {
#ifdef Q_OS_ANDROID
    return get_ifandroid();
#elif defined Q_OS_LINUX
    return get_iflinux();
#endif

}

#ifdef Q_OS_ANDROID
int get_ifandroid() {
    QAndroidJniObject c = QtAndroid::androidContext();//get android context, with qt 5.7
    jobject jcont = c.object<jobject>();//interpret into a understandable element for a java
    //get signal strength, the best: 0 - the worst: -100
    int rssi;
    rssi = QAndroidJniObject::callStaticMethod<jint>("org/qwifi/stren",
                                                     "check",
                                                     "(Landroid/content/Context;)I",
                                                     jcont);
    return rssi;
}

#elif defined Q_OS_LINUX
int get_iflinux() {
    int size;
    QString str = NULL;
    QString buff = NULL;
    QFile file("/proc/net/wireless");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
       // error message here
       return -100;
    }
    do {
        buff += file.readLine();
    } while( !file.atEnd() );
    file.close();

    size = buff.size();
    if(size > 162) {
        for(int i = 0; i < 2; ++i) {//
            str += buff[183+i];
        }
        return (100 - str.toInt());
    }
    else return -100;
}
#endif
