
import 'package:algo_f1/models/TechModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Divide extends StatefulWidget {

  final Techniques techniques;
  final String title;
  final Object avatar;
  Divide(
      this.techniques,
      this.title,{
        @required this.avatar,
      });
  @override
  _DivideState createState() => _DivideState();
}

class _DivideState extends State<Divide> {

  Widget _description(BuildContext context){
    return SafeArea(
      child: new Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        child: ListView(
            children: <Widget>[
              Wrap(
                  children: <Widget>[
                    new RichText(
                      text:TextSpan(
                        text: widget.techniques.name,
                        style: new TextStyle(
                            fontSize: 50.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    SizedBox(
                      height: 10.0,
                      width: 15.0,
                    ),
//                  new Hero(tag: widget.avatar, child: new CircleAvatar(
//                    backgroundImage: new NetworkImage(widget.techniques.image_url),
//                    radius: 30.0,
//                  )),
                  ],
              ),
              SizedBox(
                height: 10.0,
              ),
              new Text(
                widget.techniques.data,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54,
                ),)
            ],
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        title:new Text(widget.title),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: Container(
          color: Colors.indigo[100],
          child: _description(context)
      ),
    );
  }
}

