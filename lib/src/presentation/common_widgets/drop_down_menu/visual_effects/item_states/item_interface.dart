import 'package:flutter/material.dart';
import 'package:notes/src/presentation/app_colors.dart';

abstract class ItemState {
  double itemWidth = 0;

  double textSize = 0;

  double firstSpace = 0;

  double scale = 0;

  double maxTextSpace = 0;

  Color background = AppColors.black;

  double backIconSize = 0;

  double verticalPadding = 0;

  double horizontalPadding = 0;

  Color dividerColor = AppColors.black;
}
