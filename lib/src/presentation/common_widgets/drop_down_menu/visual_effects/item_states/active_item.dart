import 'package:flutter/material.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/visual_effects/item_states/item_interface.dart';

class ActiveItemState implements ItemState {
  ActiveItemState._();

  static ActiveItemState? _instance;

  @override
  double textSize = 14.0;

  @override
  double firstSpace = 8.0;

  @override
  double maxTextSpace = 104.0;

  @override
  Color background = AppColors.white;

  @override
  double backIconSize = 12.0;

  @override
  double itemWidth = 200.0;

  @override
  double scale = 1.0;

  @override
  double verticalPadding = 7;

  @override
  double horizontalPadding = 10;

  @override
  Color dividerColor = AppColors.lightBrown;

  static ActiveItemState getInstance() {
    return _instance ?? (_instance = ActiveItemState._());
  }
}
