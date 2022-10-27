import 'dart:ffi';
import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  var text = "";
  var n;
  String s = "";
  var count = 0;
  var d_count = 0.0;
  String countstr = "";
  var text1 = "";
  var text2 = "";
  String s1 = "";
  String s2 = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("計算機"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child:
                  Text(
                    text,
                    style: TextStyle(fontSize: 40,),
                    maxLines: 1,textAlign: TextAlign.end,
                  ),
                ),
              ]
          ),
          SizedBox(height: 50,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 70,width:90, child: ElevatedButton(
                  child: Text('AC'),
                  onPressed: () {setState(() {text="";});},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('<-'),
                  onPressed: () {setState(() {
                    if(text == "Error"){
                      text = "";
                    }else{
                      text = text.substring(0,text.length-1);
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('+/-'),
                  onPressed: () {setState(() {
                    s = "";
                    int k = 0;
                    for(int i=text.length-1;i>=0;i--){
                      if(text[i]==")"){
                        k=1;
                      }else if(text[i]=="("){
                        k=0;
                      }else if(text[i]=="+" || text[i]=="-" || text[i]=="*" || text[i]=="/"){
                        if(k==0){
                          break;
                        }else{
                          s += text[i];
                        }
                      }else{
                        s += text[i];
                      }
                    }
                    s = s.split('').reversed.join();
                    if(s.contains(".")){
                      n = double.parse(s);
                    }else{
                      n = int.parse(s);
                    }
                    if(n>=0){
                      text = text.substring(0,text.length-1-s.length+1);
                      n*=-1;
                      s = n.toString();
                      text += "("+s+")";
                    }else{
                      text = text.substring(0,text.length-1-s.length+1-2);
                      n*=-1;
                      s = n.toString();
                      text += s;
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('/'),
                  onPressed: () {setState(() {
                    if(text[text.length-1]=="+" || text[text.length-1]=="-" || text[text.length-1]=="*" || text[text.length-1]=="/"){
                      text = text.replaceRange(text.length-1, text.length, "/");
                    }else{
                      text += "/";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),))]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 70,width:90, child: ElevatedButton(
                  child: Text('7'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "7";
                    }else if(text[text.length-1]!="%"){
                      text += "7";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('8'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "8";
                    }else if(text[text.length-1]!="%"){
                      text += "8";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('9'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "9";
                    }else if(text[text.length-1]!="%"){
                      text += "9";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('*'),
                  onPressed: () {setState(() {
                    if(text[text.length-1]=="+" || text[text.length-1]=="-" || text[text.length-1]=="*" || text[text.length-1]=="/"){
                      text = text.replaceRange(text.length-1, text.length, "*");
                    }else{
                      text += "*";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),))]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 70,width:90, child: ElevatedButton(
                  child: Text('4'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "4";
                    }else if(text[text.length-1]!="%"){
                      text += "4";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('5'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "5";
                    }else if(text[text.length-1]!="%"){
                      text += "5";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('6'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "6";
                    }else if(text[text.length-1]!="%"){
                      text += "6";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('-'),
                  onPressed: () {setState(() {
                    if(text[text.length-1]=="+" || text[text.length-1]=="-" || text[text.length-1]=="*" || text[text.length-1]=="/"){
                      text = text.replaceRange(text.length-1, text.length, "-");
                    }else{
                      text += "-";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),))]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 70,width:90, child: ElevatedButton(
                  child: Text('1'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "1";
                    }else if(text[text.length-1]!="%"){
                      text += "1";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('2'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "2";
                    }else if(text[text.length-1]!="%"){
                      text += "2";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('3'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "3";
                    }else if(text[text.length-1]!="%"){
                      text += "3";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('+'),
                  onPressed: () {setState(() {
                    if(text[text.length-1]=="+" || text[text.length-1]=="-" || text[text.length-1]=="*" || text[text.length-1]=="/"){
                      text = text.replaceRange(text.length-1, text.length, "+");
                    }else{
                      text += "+";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),))]),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 70,width:90, child: ElevatedButton(
                  child: Text('%'),
                  onPressed: () {setState(() {text += "%";});},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('0'),
                  onPressed: () {setState(() {
                    if(text == ""){
                      text += "0";
                    }else if(text[text.length-1]!="%"){
                      text += "0";
                    }
                  });},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('.'),
                  onPressed: () {setState(() {text += ".";});},
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),)),
                SizedBox(height: 70,width:90,child: ElevatedButton(
                  child: Text('='),
                  onPressed: () {
                    count = 0;
                    text += "=";
                    countstr = "";
                    text1 = "";
                    text2 = "";
                    s = "";
                    s1 = "";
                    s2 = "";
                    int k=0;
                    for(int i=0; i<text.length; i++){
                      if (text[i]=="("){
                        k=1;
                      }else if(text[i]==")"){
                        k=0;
                      }else if(text[i]=="%"){
                        double t1 = double.parse(text1);
                        t1 /= 100;
                        text1 = t1.toString();
                      }else if(text[i]=="+" || text[i]=="-" || text[i]=="*" || text[i]=="/" || text[i]=="="){
                        if(k==1){
                          text1+="-";
                          continue;
                        }
                        if(text2!="") {
                          s2 = s1;//2
                          s1 = text[i];
                        }else {
                          s1 = text[i];//1
                          text2 = text1;
                          text1 = "";
                        }
                      }else{
                        text1 += text[i];
                      }
                      if(s2 == "+"){
                        double t2 = double.parse(text2);
                        double t1 = double.parse(text1);
                        assert(t2 is double);
                        assert(t1 is double);
                        d_count = t2 + t1;
                      }else if(s2 == "-"){
                        double t2 = double.parse(text2);
                        double t1 = double.parse(text1);
                        assert(t2 is double);
                        assert(t1 is double);
                        d_count = t2 - t1;
                      }else if(s2 == "*"){
                        double t2 = double.parse(text2);
                        double t1 = double.parse(text1);
                        assert(t2 is double);
                        assert(t1 is double);
                        d_count = t2 * t1;
                      }else if(s2 == "/"){
                        double t2 = double.parse(text2);
                        double t1 = double.parse(text1);
                        assert(t2 is double);
                        assert(t1 is double);
                        d_count = t2 / t1;
                        if(t1 == 0){
                          countstr = "Error";
                          break;
                        }
                      }
                      if(s1 == "=" && s2 == ""){
                        d_count = double.parse(text2);
                      }

                      if (s2=="+" || s2=="-" || s2=="*" || s2=="/"){
                        text2 = d_count.toString();
                        s2 = "";
                        text1 = "";
                      }
                      if(text[i]=="=") {
                        break;
                      }
                    }
                    if(countstr == "Error"){
                      countstr = "Error";
                    }else if(d_count/d_count.round() == 1.0){
                      count = d_count.round();
                      countstr = count.toString();
                      if(count<0){
                        countstr = "("+countstr+")";
                      }
                    }else{
                      countstr = d_count.toString();
                      if(d_count<0){
                        countstr = "("+countstr+")";
                      }
                    }
                    setState(() {text = countstr;});
                    },
                  style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 30),),))]),],
      ),
    );
  }
}
