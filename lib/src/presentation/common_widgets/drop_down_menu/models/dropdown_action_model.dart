import 'package:flutter/cupertino.dart';

class DropdownAction {
  DropdownAction({
    required this.title,
    required this.onTap,
    required this.icon,
    this.isSelected = false,
  });

  final String title;
  final IconData icon;
  bool isSelected;
  final Function() onTap;
  Color? tapResponseColor;
}
