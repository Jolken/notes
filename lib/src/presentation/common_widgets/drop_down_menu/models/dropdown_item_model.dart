import 'package:flutter/cupertino.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/models/dropdown_action_model.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/visual_effects/item_states/active_item.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/visual_effects/item_states/item_interface.dart';

class DropDownItem {
  DropDownItem({
    required this.title,
    required this.icon,
    required this.actions,
    this.isActive = false,
  });

  final String title;
  final IconData icon;
  final List<DropdownAction> actions;
  bool isActive;
  ItemState visualState = ActiveItemState.getInstance();
  Color? tapResponseColor;
}
