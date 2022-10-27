import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
      ),
      home: inter(),
    );
  }
}

class inter extends StatefulWidget {
  @override
  _interState createState() =>_interState();
}

class _interState extends State<inter> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double bmi = -1;
  String deg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'height',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'weight',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(height: 50,width:120,child: ElevatedButton(
              child: Text('Calculate'),
              onPressed: () {
                cal();
                degree();
              },
              style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20),),),
            ),
            SizedBox(height: 15),
            Text(
              bmi == -1 ? "Enter Value" : "BMI=${bmi.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              deg,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void cal() {
    double h = double.parse(_heightController.text) / 100;
    double w = double.parse(_weightController.text);

    double h2 = h * h;
    double result = w / h2;
    bmi = result;
    setState(() {});
  }
  void degree(){
    if(bmi<18.5){
      deg = "體重過輕";
    }else if(bmi>=18.5 && bmi<24){
      deg = "正常範圍";
    }else if(bmi>=24 && bmi<27){
      deg = "體重過重";
    }else if(bmi>=27 && bmi<30){
      deg = "輕度肥胖";
    }else if(bmi>=30 && bmi<35){
      deg = "中度肥胖";
    }else if(bmi>=35){
      deg = "重度肥胖";
    }else{
      deg = "輸入有誤!BMI異常";
    }
  }
}