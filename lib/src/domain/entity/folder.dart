import 'package:flutter/material.dart';
import 'package:notes/src/domain/entity/note.dart';

class Folder {
  Folder({
    required this.id,
    required this.name,
    required this.background,
    required this.icon,
    required this.dateOfCreation,
  });

  String name;
  final int id;
  Color background;
  Icon icon;
  final DateTime dateOfCreation;
  List<Note>? notes;
}
