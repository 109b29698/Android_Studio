import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';
import 'package:date_time_picker/date_time_picker.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('首頁'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Image.asset('assets/images/00.jpg',fit: BoxFit.contain,),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.greenAccent,borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),)),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('首頁'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('體重'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('日記'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ThreeRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('統計'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FourRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('更多'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FiveRoute()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('體重'),
      ),
      body: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Container(
            child: Column(
                children: [
                  DateTimePicker(
                    initialValue: '',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Date',
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ),
                  SizedBox(width: 20, height: 20,),
                  Container(
                    padding: EdgeInsets.all(10),
                      height: 240, child: _simpleLine()
                  ),
                  SizedBox(width: 20, height: 20,),
                  SizedBox(
                    width: 160, height: 80,
                    child: ElevatedButton(
                      child: const Text(
                          '計錄體重',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FiveRoute()),
                        );
                      },
                    ),
                  ),
                ]
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.greenAccent,borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),)),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('首頁'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('體重'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('日記'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ThreeRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('統計'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FourRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('更多'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FiveRoute()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _simpleLine() {

    final serial1 = [
      new SeriesDatas(0, 70),
      new SeriesDatas(1, 75),
      new SeriesDatas(2, 69),
      new SeriesDatas(3, 67),
      new SeriesDatas(4, 75),
      new SeriesDatas(5, 66),
      new SeriesDatas(6, 67),
      new SeriesDatas(7, 68),
      new SeriesDatas(8, 67),
      new SeriesDatas(9, 66),
      new SeriesDatas(10, 65),
      new SeriesDatas(11, 63),
      new SeriesDatas(12, 60),
    ];

    var seriesList = [
      new charts.Series<SeriesDatas, int>(
        id: 'Line 1',
        colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
        //定義線的顏色
        domainFn: (SeriesDatas sales,_) => sales.time,
        //資料的先後依據，簡單理解為圖表的 x 軸
        measureFn: (SeriesDatas sales,_) => sales.data,
        //數據資料的對應，簡單理解為圖表的 y 軸
        data: serial1,
        //指向資料來源
      )
    ];

    return charts.LineChart(seriesList, animate: true);
  }
}

class SeriesDatas{
  final int time;
  final int data;
  SeriesDatas(this.time,this.data);
}

class ThreeRoute extends StatelessWidget {
  const ThreeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('日記'),
      ),
      body: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.greenAccent,borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),)),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('首頁'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('體重'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('日記'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ThreeRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('統計'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FourRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('更多'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FiveRoute()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BarDatas{
  final String time;
  final int data;
  BarDatas(this.time,this.data);
}

class FourRoute extends StatelessWidget {
  const FourRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('統計'),
      ),
      body: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Container(
            child: Column(
                children: [
                  DateTimePicker(
                    initialValue: '',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Date',
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ),
                  SizedBox(width: 20, height: 20,),
                  Container(
                      padding: EdgeInsets.all(10),
                      height: 240, child: _simpleBar()
                  ),
                ]
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.greenAccent,borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),)),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('首頁'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('體重'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('日記'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ThreeRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('統計'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FourRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('更多'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FiveRoute()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _simpleBar() {

    final Bar = [
      new BarDatas('熱量', 70),
      new BarDatas('蛋白質', 70),
      new BarDatas('脂肪', 70),
      new BarDatas('碳水化合物', 70),
      new BarDatas('鈉', 70),
    ];

    var seriesList = [
      new charts.Series<BarDatas, String>(
        id: 'Bar1',
        colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
        //定義線的顏色
        domainFn: (BarDatas sales,_) => sales.time,
        //資料的先後依據，簡單理解為圖表的 x 軸
        measureFn: (BarDatas sales,_) => sales.data,
        //數據資料的對應，簡單理解為圖表的 y 軸
        data: Bar,
        //指向資料來源
      )
    ];
    return charts.BarChart(seriesList, animate: true);
  }
}

class FiveRoute extends StatelessWidget {
  const FiveRoute({super.key});

  @override
  Widget build(BuildContext context) {
    double bmi = -1;
    String deg = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('更多'),
      ),
      body: Stack(
        alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: '身高',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: '體重',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: '名稱',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: '性別',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: '信箱',
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.greenAccent,borderRadius: const BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),)),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('首頁'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => const FirstRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('體重'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SecondRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('日記'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ThreeRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('統計'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FourRoute()),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 10, height: 10,),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      child: const Text('更多'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                        shape:MaterialStateProperty.all(
                            CircleBorder()
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FiveRoute()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}