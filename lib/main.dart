import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Design/HomeTechniques.dart';

void main(){
  runApp(MyApp());
//  SystemChrome.setPreferredOrientations([
//    DeviceOrientation.portraitUp,
//    DeviceOrientation.portraitDown,
//  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //primaryColor: Colors.indigo,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: new Home(),
      ),
    );
  }
}


//double _value;
//int _turns;
//
//@override
//void initState(){
//  _value=0.0;
//  _turns=0;
//}
//
//void _onChanged(double value){
//  setState((){
//    _value=value;
//    _turns=_value.toInt();
//  });
//}

