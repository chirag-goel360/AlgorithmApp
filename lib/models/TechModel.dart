import 'package:flutter/material.dart';

class Techniques{
  final String name;
  final String description;
  final int id;
  final String image_url;
  final String data;

  Techniques({
    @required this.name,
    this.description,
    @required this.id,
    @required this.image_url,
    @required this.data,
  });
}