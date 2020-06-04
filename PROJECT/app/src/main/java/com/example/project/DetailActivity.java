package com.example.project;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.engine.DiskCacheStrategy;

import static com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions.withCrossFade;

public class DetailActivity extends AppCompatActivity {
    TextView tvnama, tvharga, tvdeskripsi;
    ImageView ivgambar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        tvnama = (TextView) findViewById(R.id.namaDetail);
        tvharga = (TextView) findViewById(R.id.hargaDetail);
        ivgambar = (ImageView) findViewById(R.id.gambarDetail);
        tvdeskripsi = (TextView) findViewById(R.id.deskripsiDetail);

        tvnama.setText(getIntent().getStringExtra("nama"));
        tvharga.setText(Integer.toString(getIntent().getIntExtra("harga", 0)));
        Glide.with(getApplicationContext()).load(getIntent().getStringExtra("gambar"))
                .thumbnail(0.5f).transition(withCrossFade())
                .diskCacheStrategy(DiskCacheStrategy.ALL).into(ivgambar);
        tvdeskripsi.setText(getIntent().getStringExtra("deskripsi"));
    }
}
