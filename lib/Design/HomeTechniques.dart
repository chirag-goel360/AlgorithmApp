import 'package:algo_f1/Design/HomeSite.dart';
import 'package:flutter/material.dart';
import 'Algorithms.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index=0;
  final List<Widget> _barItems=[
    DifferentAlgorithms(),
    HomeFinal(),
  ];
  void _onTapBar(int index){
    setState(() {
      _index=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _barItems[_index],
      bottomNavigationBar: new BottomNavigationBar(
          backgroundColor: Colors.deepPurpleAccent,
          onTap: _onTapBar,
          currentIndex: _index,
          items: [
            new BottomNavigationBarItem(
              icon:new Icon(Icons.school),
              backgroundColor: Colors.deepPurple,
              title: Text("Algorithms",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.laptop,),
                title: new Text("Techniques",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18
                ),),
                backgroundColor: Colors.deepPurple
            ),
          ]),
    );
  }
}
