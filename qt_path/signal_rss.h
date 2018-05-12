#ifndef SIGNAL_RSS_H
#define SIGNAL_RSS_H

#include <QObject>
#include <QVariant>

class signal_rss : public QObject {
    Q_OBJECT
public:
    explicit signal_rss(QObject *parent = 0);

signals:

public slots:
    void wifi_slot();
};

QString get_rssi();

#endif // SIGNAL_RSS_H
