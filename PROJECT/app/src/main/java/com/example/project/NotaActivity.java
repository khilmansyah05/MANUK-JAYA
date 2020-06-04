package com.example.project;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class NotaActivity extends AppCompatActivity {
    int total, bayar, kembali;
    String username;
    public static final String TAG_USERNAME = "username";
    TextView tvtotal, tvbayar, tvkembali, user;

    SharedPreferences sharedpreferences;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_nota);

        username = getIntent().getStringExtra(TAG_USERNAME);
        sharedpreferences = getSharedPreferences(LoginActivity.my_shared_preferences, Context.MODE_PRIVATE);
        total = getIntent().getIntExtra("total", 0);
        bayar = getIntent().getIntExtra("bayar", 0);
        kembali = getIntent().getIntExtra("kembalian", 0);

        user = (TextView) findViewById(R.id.akun);
        tvtotal = (TextView) findViewById(R.id.total);
        tvbayar = (TextView) findViewById(R.id.bayar);
        tvkembali = (TextView) findViewById(R.id.kembali);

        user.setText(username);
        tvtotal.setText(Integer.toString(total));
        tvbayar.setText(Integer.toString(bayar));
        tvkembali.setText(Integer.toString(kembali));
    }

    public void home(View view) {
        SharedPreferences.Editor editor = sharedpreferences.edit();
        editor.putBoolean(LoginActivity.session_status, false);
        editor.putString(TAG_USERNAME, null);
        editor.commit();
        Intent finish = new Intent(getApplicationContext(), LoginActivity.class);
        startActivity(finish);
        finish();
    }
}
