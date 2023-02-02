import 'package:flutter/material.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/visual_effects/item_states/item_interface.dart';

class DisabledItemState implements ItemState {
  DisabledItemState._();

  static DisabledItemState? _instance;

  @override
  double textSize = 11.0;

  @override
  double firstSpace = 6.0;

  @override
  double maxTextSpace = 104.0;

  @override
  Color background = AppColors.lightBrown;

  @override
  double backIconSize = 8.0;

  @override
  double itemWidth = 160;

  @override
  double scale = 0.75;

  @override
  double verticalPadding = 3.0;

  @override
  double horizontalPadding = 7.5;

  @override
  Color dividerColor = AppColors.darkBrown;

  static DisabledItemState getInstance() {
    return _instance ?? (_instance = DisabledItemState._());
  }
}
