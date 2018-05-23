#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "signal_rss.h"

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("Scaner");
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QObject* root = engine.rootObjects()[0];
    signal_rss *sig = new signal_rss(root);
//    QObject::connect(root, SIGNAL(qmlSignal()),
//    sig, SLOT(wifi_slot()));
    return app.exec();
}
