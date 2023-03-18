import 'package:flutter/material.dart';

class Note {
  Note({
    required this.text,
    required this.name,
    required this.background,
  });

  String name;
  String text;
  Color background;
}
