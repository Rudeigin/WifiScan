package com.ex.check;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.format.Formatter;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        @SuppressLint("WifiManagerLeak")WifiManager wifiManager = (WifiManager) getSystemService(Context.WIFI_SERVICE);
        WifiInfo wifiInfo = wifiManager.getConnectionInfo();
        TextView details = (TextView) findViewById(R.id.textView);
        String info = "SSID: " + wifiInfo.getSSID() + "\nStrength: " + wifiInfo.getRssi() + "dBm" + "\nSignal Level: " + WifiManager.calculateSignalLevel(wifiInfo.getRssi(), 5) + "/5" + "\nSpeed: " + wifiInfo.getLinkSpeed() + "Mbps" + "\nIP Address: " + Formatter.formatIpAddress(wifiInfo.getIpAddress()) + "\nMAC Address: " + wifiInfo.getMacAddress() + "\nFrequency: " + "\nHidden SSID: "+ wifiInfo.getHiddenSSID();

        details.setText(info);
    }

}
