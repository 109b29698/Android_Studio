package com.example.tackleleftoversapp;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import androidx.annotation.Nullable;

import java.util.ArrayList;
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
                "Food TEXT, " +
                "Number TEXT," +
                "Unit TEXT," +
                "Date TEXT" +
                ");";
        db.execSQL(SQLTable);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        final String SQL = "DROP TABLE " + TableName;
        db.execSQL(SQL);
    }

    public void addData(String fName, String fNumber, String fUnit, String fDate) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put("Food", fName);
        values.put("Number", fNumber);
        values.put("Unit", fUnit);
        values.put("Date", fDate);
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


    public ArrayList<HashMap<String, String>> searchByFDate(String getFDate) {
        SQLiteDatabase db = getReadableDatabase();
        Cursor c = db.rawQuery(" SELECT * FROM " + TableName + " WHERE Date =" + "'" + getFDate + "'", null);
        ArrayList<HashMap<String, String>> arrayList = new ArrayList<>();
        while (c.moveToNext()) {
            HashMap<String, String> hashMap = new HashMap<>();

            String id = c.getString(0);
            String fName = c.getString(1);
            String fNumber = c.getString(2);
            String fUnit = c.getString(3);
            String fDate = c.getString(4);

            hashMap.put("Id", id);
            hashMap.put("Food", fName);
            hashMap.put("Number", fNumber);
            hashMap.put("Unit", fUnit);
            hashMap.put("Date", fDate);
            arrayList.add(hashMap);
        }
        return arrayList;
    }

}