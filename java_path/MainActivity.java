package com.ex.check;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void check(View view) {
        @SuppressLint("WifiManagerLeak")WifiManager wifiManager = (WifiManager) getSystemService(Context.WIFI_SERVICE);
        String info;
        TextView details = (TextView) findViewById(R.id.textView);
        if (wifiManager.isWifiEnabled()) {
            WifiInfo wifiInfo = wifiManager.getConnectionInfo();
            info = "SSID: " + wifiInfo.getSSID() + "\nStrength: " + wifiInfo.getRssi() + "dBm" + "\nSpeed: " + wifiInfo.getLinkSpeed() + "Mbps";
        }
        else {
            info = "Wi-Fi не подключен";
        }
        details.setText(info);
    }
}
