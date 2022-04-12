package com.example.a123;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    TextView number1,number2;
    int n,m,sum,big,small,answer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        number1 = findViewById(R.id.number);
        number2 = findViewById(R.id.number2);
        n=0;
        m=0;
        sum=0;
        big=100;small=1;
        answer = (int)(Math.random()*100)+1;
    }

    public void bt0(View view){
        if(n==0){
            m=0;
            sum=m;
        }else{
            m=0;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void bt1(View view){
        if(n==0){
            m=1;
            sum=m;
        }else{
            m=1;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void bt2(View view){
        if(n==0){
            m=2;
            sum=m;
        }else{
            m=2;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void bt3(View view){
        if(n==0){
            m=3;
            sum=m;
        }else{
            m=3;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void bt4(View view){
        if(n==0){
            m=4;
            sum=m;
        }else{
            m=4;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void bt5(View view){
        if(n==0){
            m=5;
            sum=m;
        }else{
            m=5;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void bt6(View view){
        if(n==0){
            m=6;
            sum=m;
        }else{
            m=6;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void bt7(View view){
        if(n==0){
            m=7;
            sum=m;
        }else{
            m=7;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void bt8(View view){
        if(n==0){
            m=8;
            sum=m;
        }else{
            m=8;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void bt9(View view){
        if(n==0){
            m=9;
            sum=m;
        }else{
            m=9;
            sum*=10;
            sum+=m;
        }
        number2.setText(Integer.toString(sum));
        n++;
    }

    public void delete(View view){
        number2.setText("");
        sum=0;
        n=0;
    }

    public void enter(View view){
        if(sum==answer) {
            number1.setText("猜中啦!!!");
        }else if(sum<big && sum>small){
            if(sum>answer){
                big=sum;
            }else if(sum<answer){
                small=sum;
            }
            number1.setText(Integer.toString(small)+"~"+Integer.toString(big));
        }else{
            Toast.makeText(this,"請輸入"+Integer.toString(small)+"~"+Integer.toString(big)+"內的整數!!!",Toast.LENGTH_SHORT).show();
        }
        number2.setText("");
        sum=0;
        n=0;
    }
}