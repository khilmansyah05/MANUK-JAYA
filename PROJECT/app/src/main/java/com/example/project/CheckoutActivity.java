package com.example.project;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class CheckoutActivity extends AppCompatActivity {
    ProgressDialog pd;
    int total, bayar, kembali = -1;
    TextView totalCheckout, kembalian;
    EditText pembayaran;
    Toast toast;

    String username;
    SharedPreferences sharedpreferences;

    public static final String TAG_USERNAME = "username";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_checkout);

        sharedpreferences = getSharedPreferences(LoginActivity.my_shared_preferences, Context.MODE_PRIVATE);
        username = getIntent().getStringExtra(TAG_USERNAME);

        pd = new ProgressDialog(CheckoutActivity.this);
        toast = Toast.makeText(getApplicationContext(), null, Toast.LENGTH_SHORT);
        totalCheckout = (TextView) findViewById(R.id.totalCheckout);
        total = getIntent().getIntExtra("total", 0);

        totalCheckout.setText(Integer.toString(total));

        pembayaran = (EditText) findViewById(R.id.pembayaran);
        kembalian = (TextView) findViewById(R.id.kembalian);

        pembayaran.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {

            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {

            }

            @Override
            public void afterTextChanged(Editable s) {
                if (pembayaran.getText().toString().trim().length() != 0) {
                    bayar = Integer.parseInt(pembayaran.getText().toString());
                    kembali = bayar - total;

                    if (kembali < 0) {
                        kembalian.setText("0.00");
                    } else {
                        kembalian.setText(Integer.toString(kembali));
                    }
                } else {
                    kembalian.setText("0.00");
                }
            }
        });

        findViewById(R.id.submit).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (kembali < 0) {
                    toast.setText("Uang pembayarannya kurang");
                    toast.show();
                } else {
                    Intent finish = new Intent(getApplicationContext(), NotaActivity.class);
                    finish.putExtra(TAG_USERNAME, username);
                    finish.putExtra("total", total);
                    finish.putExtra("bayar", bayar);
                    finish.putExtra("kembalian", kembali);
                    startActivity(finish);
                }
            }
        });
    }
}
