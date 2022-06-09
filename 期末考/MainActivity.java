package com.example.tackleleftoversapp;

import android.app.DatePickerDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.facebook.stetho.Stetho;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;

public class MainActivity extends AppCompatActivity {
    EditText txtopd1,txtopd2,txtopd3;
    TextView fdate,ans;
    Button date;

    DatePickerDialog.OnDateSetListener datePicker;
    Calendar calendar = Calendar.getInstance();
    private final String DB_NAME = "MyList.db";
    private String TABLE_NAME = "MyTable";
    private final int DB_VERSION = 1;
    SQLiteDataBaseHelper mDBHelper;

    ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();//取得所有資料
    ArrayList<HashMap<String, String>> getNowArray = new ArrayList<>();//取得被選中的項目資料
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        mDBHelper = new SQLiteDataBaseHelper(this, DB_NAME
                , null, DB_VERSION, TABLE_NAME);//初始化資料庫
        Stetho.initializeWithDefaults(this);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        txtopd1 = findViewById(R.id.txtopd1);
        txtopd2 = findViewById(R.id.txtopd2);
        txtopd3 = findViewById(R.id.txtopd3);
        fdate = findViewById(R.id.submitdate);
        date = findViewById(R.id.date);
        ans = findViewById(R.id.ans);
        datePicker = new DatePickerDialog.OnDateSetListener(){
            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth){
                calendar.set(Calendar.YEAR, year);
                calendar.set(Calendar.MONTH, monthOfYear);
                calendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                String myFormat = "yyyy/MM/dd";
                SimpleDateFormat sdf = new SimpleDateFormat(myFormat, Locale.TAIWAN);
                fdate.setText(String.format("%s", sdf.format(calendar.getTime())));
            }
        };
        date.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatePickerDialog dialog = new DatePickerDialog(MainActivity.this,
                        datePicker,
                        calendar.get(Calendar.YEAR),
                        calendar.get(Calendar.MONTH),
                        calendar.get(Calendar.DAY_OF_MONTH));
                dialog.show();
            }
        });
    }

    public void submit(View view){
        String str1 = txtopd1.getText().toString();
        String str2 = txtopd2.getText().toString();
        String str3 = txtopd3.getText().toString();
        String str4 = fdate.getText().toString();
        try{
            mDBHelper.addData(str1,str2,str3,str4);
            Toast.makeText(this,"成功紀錄...",Toast.LENGTH_SHORT).show();
        }catch(Exception ex){
            ex.printStackTrace();
            Toast.makeText(this,"紀錄失敗...",Toast.LENGTH_SHORT).show();
        }
        txtopd1.setText("");
        txtopd2.setText("");
        txtopd3.setText("");
        fdate.setText("");
        ans.setText("");
    }

    public void read(View view){
        ArrayList<HashMap<String, String>> li;
        li = mDBHelper.searchByFDate(fdate.getText().toString());
        if(li.toString()!="[]") {
            ans.setText(li.toString());
            Toast.makeText(this,"成功讀取...",Toast.LENGTH_SHORT).show();
        }else{
            Toast.makeText(this,"查無資料...",Toast.LENGTH_SHORT).show();
        }
        txtopd1.setText("");
        txtopd2.setText("");
        txtopd3.setText("");
        fdate.setText("");
    }

    public void delete(View view){
        try{
            mDBHelper.delete(fdate.getText().toString());
            Toast.makeText(this,"成功刪除...",Toast.LENGTH_SHORT).show();
        }catch(Exception ex){
            ex.printStackTrace();
            Toast.makeText(this,"刪除失敗...",Toast.LENGTH_SHORT).show();
        }
        txtopd1.setText("");
        txtopd2.setText("");
        txtopd3.setText("");
        fdate.setText("");
        ans.setText("");
    }

    public void deleteAll(View view){
        mDBHelper.deleteAll();
        txtopd1.setText("");
        txtopd2.setText("");
        txtopd3.setText("");
        fdate.setText("");
        ans.setText("");
    }
}