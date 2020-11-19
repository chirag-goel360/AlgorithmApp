import 'package:flutter/material.dart';

class Tiles extends StatelessWidget {
  final Route<Tiles> value;
  final String name;
  final String image_url;

  Tiles({Key key, this.value, this.name, this.image_url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Colors.teal;
    final secondary = Colors.pinkAccent;
    return InkWell(
      onTap:() {
        Navigator.of(context).push(value);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white54,
        ),
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              margin: EdgeInsets.only(
                right: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 3,
                  color: secondary,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    '$image_url',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '$name',
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
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