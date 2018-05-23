package org.qwifi;

import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;

public class stren extends org.qtproject.qt5.android.bindings.QtActivity {
    public static int check(Context c) {
        WifiManager wifiManager = (WifiManager) c.getSystemService(Context.WIFI_SERVICE);
        WifiInfo wifiInfo;
        int rss;
        if (wifiManager.isWifiEnabled()) {
            wifiInfo = wifiManager.getConnectionInfo();
            rss = 100 + wifiInfo.getRssi();
        }
        else rss = -100;
        return rss;
    }
}
