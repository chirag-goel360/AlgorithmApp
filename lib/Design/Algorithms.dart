import 'package:algo_f1/All_Algorithms/Graph/Graph.dart';
import 'package:algo_f1/All_Algorithms/Searching/Searching.dart';
import 'package:algo_f1/All_Algorithms/Sorting/Sorting.dart';
import 'package:algo_f1/All_Algorithms/StringMatching/StringMatching.dart';
import 'package:flutter/material.dart';
import '../All_Algorithms/BackTracking/BackTracking.dart';
import '../All_Algorithms/BitAlgorithms.dart';
import '../All_Algorithms/Dynamic/Dynamic.dart';
import '../All_Algorithms/Greedy/Greedy.dart';
import '../All_Algorithms/NumberTheory/NumberTheory.dart';
import 'TilesDesign.dart';

class DifferentAlgorithms extends StatefulWidget {
  @override
  _DifferentAlgorithmsState createState() => _DifferentAlgorithmsState();
}

class _DifferentAlgorithmsState extends State<DifferentAlgorithms> {
  final TextStyle dropdownMenuItem =
  TextStyle(color: Colors.black, fontSize: 18);

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 100),
              height: MediaQuery.of(context).size.height-90,
              width: double.infinity,
              child: ListView(
                children: <Widget>[
                  Tiles(value: MaterialPageRoute(builder: (context){
                    return Searching();
                  }), name: 'Searching Algortihms',image_url: 'https://cdn3.vectorstock.com/i/1000x1000/31/32/bulb-lamp-cartoon-with-magnifier-searching-vector-8553132.jpg',),
                  Tiles(value: MaterialPageRoute(builder: (context){
                    return Sorting();
                  }), name: 'Sorting Algorithms',image_url: 'https://embed-ssl.wistia.com/deliveries/70d6f4e10e2badb5ef394f00c17ad2bc1c14f6e7.jpg',),
                  Tiles(value: MaterialPageRoute(builder: (context){
                    return StringMatch();
                  }), name: 'String Matching Algortihms',image_url: 'https://i.ytimg.com/vi/M_XpGQyyqIQ/maxresdefault.jpg',),
                  Tiles(value: MaterialPageRoute(builder: (context){
                    return Graph();
                  }), name: 'Graph Algortihms',image_url: 'https://miro.medium.com/max/908/1*9NaTWnSvRXPv4bewvIhMNQ.png',),
                  Tiles(value: MaterialPageRoute(builder: (context){
                    return DynamicProg();
                  }), name: 'Dynamic Programming Agorithms',image_url: 'https://miro.medium.com/max/1400/1*bR6qXNEdZ3qE-ppKdILeYA.jpeg',),
                  Tiles(value:  MaterialPageRoute(builder: (context){
                    return Greedy();
                  }), name: 'Greedy Algorithms',image_url: 'https://ubdavid.org/kids-world/lets-talk-about/graphics/greedy10.jpg',),
                  Tiles(value:  MaterialPageRoute(builder: (context){
                    return NumberTheory();
                  }), name: 'Numerber Theory',image_url: 'https://img-a.udemycdn.com/course/750x422/948934_4f94_8.jpg',),
                  Tiles(value:  MaterialPageRoute(builder: (context){
                    return BitAlgo();
                  }), name: 'Bit Algortihms',image_url: 'https://resize.hswstatic.com/w_907/gif/bits-and-bytes.jpg',),
                  Tiles(value:  MaterialPageRoute(builder: (context){
                    return BackTracking();
                  }), name: 'BackTracking Algortihms',image_url: 'https://s3-us-west-2.amazonaws.com/tutorials-image/backtracking.png',),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.deepPurple.shade500,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Implemented Algorithms",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}