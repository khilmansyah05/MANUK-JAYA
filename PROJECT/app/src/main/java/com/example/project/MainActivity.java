package com.example.project;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.example.project.Adapter.AdapterData;
import com.example.project.Model.ModelData;
import com.example.project.Util.AppController;
import com.example.project.Util.ServerAPI;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity implements AdapterData.ItemClickListener {
    RecyclerView mRecyclerview;
    AdapterData mAdapter;
    List<ModelData> mItems;
    ProgressDialog pd;
    Toast toast;

    int total = 0;

    String username;
    SharedPreferences sharedpreferences;

    ViewFlipper v_flipper;

    public static final String TAG_USERNAME = "username";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        int images[] = {R.drawable.bikang,R.drawable.pukis
                ,R.drawable.lolos,R.drawable.lumpur
                ,R.drawable.putu,R.drawable.semut};
        v_flipper = findViewById(R.id.v_flipper);
        for (int i =0; i<images.length; i++){
            fliverImages(images[i]);
        }
        for (int image: images)
            fliverImages(image);
        mRecyclerview = (RecyclerView)
                findViewById(R.id.recyclerView);
        pd = new ProgressDialog(MainActivity.this);
        mItems = new ArrayList<>();

        sharedpreferences = getSharedPreferences(LoginActivity.my_shared_preferences, Context.MODE_PRIVATE);
        username = getIntent().getStringExtra(TAG_USERNAME);

        toast = Toast.makeText(getApplicationContext(), null, Toast.LENGTH_SHORT);
        mRecyclerview = (RecyclerView) findViewById(R.id.recyclerView);
        pd = new ProgressDialog(MainActivity.this);
        mItems = new ArrayList<>();
        loadJson();
        mRecyclerview.setLayoutManager(new GridLayoutManager(this, 2));
        mAdapter = new AdapterData(MainActivity.this, mItems);
        mRecyclerview.setAdapter(mAdapter);
        mAdapter.setClickListener(this);
    }

    private void loadJson() {
        pd.setMessage("Mengambil Data");
        pd.setCancelable(false);
        pd.show();
        JsonArrayRequest reqData = new JsonArrayRequest(Request.Method.POST, ServerAPI.URL_DASHBOARD,
                null, new Response.Listener<JSONArray>() {
            @Override
            public void onResponse(JSONArray response) {
                pd.cancel();
                for (int i = 0; i < response.length(); i++) {
                    try {
                        JSONObject data = response.getJSONObject(i);

                        ModelData md = new ModelData();
                        md.setKode(data.getString("kode"));
                        md.setNama(data.getString("nama"));
                        md.setHarga(data.getInt("harga"));
                        md.setGambar(ServerAPI.URL + ServerAPI.URL_IMAGE + data.getString("gambar"));
                        md.setDeskripsi(data.getString("deskripsi"));
                        mItems.add(md);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
                mAdapter.notifyDataSetChanged();
            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        pd.cancel();

                        Log.d("volley", "error : " + error.getMessage());
                    }
                });

        AppController.getInstance().addToRequestQueue(reqData);
    }

    public void onClick(View view, int position) {
        //final Produk mhs = produkArrayList.get(position);
        final ModelData md = mItems.get(position);
        switch (view.getId()) {
            case R.id.nama:
                Intent detail = new Intent(this, DetailActivity.class);
                detail.putExtra("nama", md.getNama());
                detail.putExtra("harga", md.getHarga());
                detail.putExtra("gambar", md.getGambar());
                detail.putExtra("deskripsi", md.getDeskripsi());
                startActivity(detail);
                return;
            case R.id.gambar:
                total = total + md.getHarga();
                toast.setText("Pesanan....." + md.getNama());
                toast.show();
                postTotals();
                return;
            default:
                toast.setText("Info..... -> " + md.getNama() + " Rp. " + md.getHarga());
                toast.show();
                break;
        }
    }

    public void postTotals() {
        TextView tvtotal = (TextView) findViewById(R.id.total);;
        tvtotal.setText(Integer.toString(total));
    }

    public void checkout(View view) {
        if (total > 0) {
            Intent checkout = new Intent(this, CheckoutActivity.class);
            checkout.putExtra(TAG_USERNAME, username);
            checkout.putExtra("total", total);
            startActivity(checkout);
        } else {
            toast.setText("Belanja Dulu");
            toast.show();
        }
    }
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        setMode(item.getItemId());
        return super.onOptionsItemSelected(item);
    }
    public void setMode(int selectedMode) {
        switch (selectedMode) {
            case R.id.action_call:
                String phone = "081234363082";
                Intent intent = new Intent(Intent.ACTION_DIAL, Uri.fromParts("tel", phone, null));
                startActivity(intent);
                break;
            case R.id.action_sms:
                Uri uri = Uri.parse("smsto:081234363082");
                Intent it = new Intent(Intent.ACTION_SENDTO, uri);
                it.putExtra("sms_body", "Here you can set the SMS text to be sent");
                startActivity(it);
                break;
            case R.id.action_maps:
                Intent intentt = new Intent(android.content.Intent.ACTION_VIEW,
                        Uri.parse("https://www.google.com/maps/place/Dian+Nuswantoro+University/@-6.9828663,110.406908,17z/data=!3m1!4b1!4m5!3m4!1s0x2e708b4ec52229d7:0xc791d6abc9236c7!8m2!3d-6.9828663!4d110.4090967"));
                startActivity(intentt);
                break;
            case  R.id.action_update:
                Intent i=new Intent(MainActivity.this,RegisterActivity.class);
                startActivity(i);
                break;
            case R.id.action_logout:
                SharedPreferences.Editor editor = sharedpreferences.edit();
                editor.putBoolean(LoginActivity.session_status, false);
                editor.putString(TAG_USERNAME, null);
                editor.commit();
                Intent finish = new Intent(getApplicationContext(), LoginActivity.class);
                startActivity(finish);
                finish();
                break;
        }
    }
    public void fliverImages(int images){
        ImageView imageView = new ImageView(this);
        imageView.setBackgroundResource(images);
        v_flipper.addView(imageView);
        v_flipper.setFlipInterval(4000);
        v_flipper.setAutoStart(true);
        v_flipper.setInAnimation(this,android.R.anim.slide_in_left);
        v_flipper.setOutAnimation(this,android.R.anim.slide_out_right);
    }
}
