package com.ex.check;

import android.annotation.SuppressLint;
import android.content.Context;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;
import android.view.Menu;
import android.view.MenuItem;

public class MainActivity extends AppCompatActivity {

    MenuItem aboutItem;
    MenuItem informationItem;
    TextView details;
    ImageButton button;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        details = (TextView) findViewById(R.id.textView);
    }

    public void check(View view) {
        @SuppressLint("WifiManagerLeak")WifiManager wifiManager = (WifiManager) getSystemService(Context.WIFI_SERVICE);
        String info;
        if (wifiManager.isWifiEnabled()) {
            WifiInfo wifiInfo = wifiManager.getConnectionInfo();
            info = "SSID: " + wifiInfo.getSSID() + "\nStrength: " + wifiInfo.getRssi() + "dBm" + "\nSpeed: " + wifiInfo.getLinkSpeed() + "Mbps";
        }
        else {
            info = "Wi-Fi не подключен";
        }
        details.setText(info);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu, menu);

        aboutItem = menu.findItem(R.id.aboutItem);
        informationItem = menu.findItem(R.id.informationItem);
        button = findViewById(R.id.button);

        MenuItem.OnMenuItemClickListener onMenuClickListener = new MenuItem.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                switch (item.getItemId()) {
                    case R.id.aboutItem:
                        details.setText("About Menu Item is pressed");
                        button.setVisibility(View.INVISIBLE);
                        break;
                    case R.id.informationItem:
                        button.setVisibility(View.VISIBLE);
                        details.setText("Нажми обновить");
                        break;
                }
                return true;
            }
        };
        aboutItem.setOnMenuItemClickListener(onMenuClickListener);
        informationItem.setOnMenuItemClickListener(onMenuClickListener);
        return true;
    }
}

