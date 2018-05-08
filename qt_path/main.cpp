#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtAndroidExtras>

int main(int argc, char *argv[])
{
    QGuiApplication::setApplicationName("Scaner");
    QGuiApplication app(argc, argv);


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
