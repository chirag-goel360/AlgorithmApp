import 'package:algo_f1/models/TechModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Divide extends StatefulWidget {
  final Techniques techniques;
  final String title;
  final Object avatar;
  Divide(
      this.techniques,
      this.title,
      {
        @required this.avatar,
      }
      );

  @override
  _DivideState createState() => _DivideState();
}

class _DivideState extends State<Divide> {
  Widget _description(BuildContext context){
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                RichText(
                  text:TextSpan(
                    text: widget.techniques.name,
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                  width: 15.0,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              widget.techniques.data,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.indigo[100],
        child: _description(context),
      ),
    );
  }
}