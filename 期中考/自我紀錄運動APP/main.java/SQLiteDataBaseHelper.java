package com.example.app;


import android.content.ContentValues;
import android.content.Context;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;


import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;


public class SQLiteDataBaseHelper extends SQLiteOpenHelper {
    String TAG = SQLiteDataBaseHelper.class.getSimpleName();
    String TableName;

    public SQLiteDataBaseHelper(@Nullable Context context, @Nullable String name, @Nullable SQLiteDatabase.CursorFactory factory, int version, String TableName) {
        super(context, name, factory, version);
        SQLiteDataBaseHelper.this.TableName = TableName;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String SQLTable = "CREATE TABLE IF NOT EXISTS " + TableName + "( " +
                "_id INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "Sport TEXT, " +
                "Time TEXT," +
                "Date TEXT" +
                ");";
        db.execSQL(SQLTable);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        final String SQL = "DROP TABLE " + TableName;
        db.execSQL(SQL);
    }

    public void addData(String exciseName, String exciseTime, String exciseData) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("Sport", exciseName);
        values.put("Time", exciseTime);
        values.put("Date", exciseData);
        db.insert(TableName, null, values);
    }

    public void delete(String date){
        SQLiteDatabase db = getWritableDatabase();
        db.delete(TableName,"Date = ?" ,new String[] {date});
    }

    public void deleteAll(){
        SQLiteDatabase db = getWritableDatabase();
        db.execSQL("delete from "+ TableName);
    }


    public ArrayList<HashMap<String, String>> searchByExciseData(String getExciseData) {
        SQLiteDatabase db = getReadableDatabase();
        Cursor c = db.rawQuery(" SELECT * FROM " + TableName + " WHERE Date =" + "'" + getExciseData + "'", null);
        ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
        while (c.moveToNext()) {
            HashMap<String, String> hashMap = new HashMap<>();

            String id = c.getString(0);
            String exname = c.getString(1);
            String extime = c.getString(2);
            String exdata = c.getString(3);

            hashMap.put("Id", id);
            hashMap.put("Sport", exname);
            hashMap.put("Time", extime);
            hashMap.put("Date", exdata);
            arrayList.add(hashMap);
        }
        return arrayList;
    }

}