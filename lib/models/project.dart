import 'package:flutter/material.dart';

class Project {
  String image;
  String name;
  String description;
  String link;
  Project({
    @required this.image,
    @required this.name,
    @required this.description,
    @required this.link,
  }) :
    assert(image!=null),
    assert(name!=null),
    assert(link!=null)
  ;
}