#ifndef SIGNAL_RSS_H
#define SIGNAL_RSS_H

#include <QObject>
#include <QVariant>
#include <QString>
#include <QTimer>

class signal_rss : public QObject {
    Q_OBJECT
public:
    explicit signal_rss(QObject *parent = 0);
private:
    int buff_rssi;
    int rssi;
    QTimer * timer;
    QObject * viewMod;
    QObject * textMod;
signals:

public slots:
    void wifi_slot();
};

int get_rssi();
int get_iflinux();
int get_ifandroid();

#endif // SIGNAL_RSS_H
