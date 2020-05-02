import 'dart:convert';
import 'package:algo_f1/models/TechModel.dart';

class TechApi{
  static List<Techniques> allTechniquesFromJson(String jsonData){
    List<Techniques> techniques = [];
    json.decode(jsonData)['techniques'].forEach((tech)=>techniques.add(_forMap(tech)));
    return techniques;
  }

  static Techniques _forMap(Map<String, dynamic> map){
    return new Techniques(
      name: map['name'],
      description: map['description'],
      id: map['id'],
      image_url: map['image_url'],
      data: map['data'],
    );
  }
}
