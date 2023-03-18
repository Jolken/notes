import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/cubit/dropdown_menu_state.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/models/dropdown_action_model.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/models/dropdown_item_model.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/visual_effects/item_states/active_item.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/visual_effects/item_states/disabled_item.dart';

class DropDownMenuCubit extends Cubit<DropDownMenuState> {
  DropDownMenuCubit(List<DropDownItem> items)
      : super(
          DropDownMenuState(items: items),
        );

  void _switchSelectedAction(
    DropDownItem item,
    DropdownAction selectedAction,
  ) {
    for (var action in item.actions) {
      if (action.isSelected) {
        action.isSelected = false;
      }
      if (action.title == selectedAction.title) {
        action.isSelected = true;
      }
    }
  }

  void onActionSelected(DropdownAction selectedAction) {
    List<DropDownItem> newItems = state.items.map((item) {
      if (item.actions.contains(selectedAction)) {
        _switchSelectedAction(item, selectedAction);
      }
      return item;
    }).toList();
    emit(DropDownMenuState(items: newItems));
  }

  void onItemClick(DropDownItem selectedItem) {
    int id = state.items.indexOf(selectedItem);
    selectedItem.isActive = selectedItem.isActive ? false : true;
    final newItems = state.items.map((item) {
      if (state.items.indexOf(item) == id) {
        return selectedItem;
      } else {
        item.visualState = DisabledItemState.getInstance();
        item.isActive = false;
        return item;
      }
    }).toList();
    emit(DropDownMenuState(items: newItems));
  }

  void uncheckItem() {
    final newItems = state.items.map((item) {
      item.visualState = ActiveItemState.getInstance();
      item.isActive = false;
      return item;
    }).toList();
    emit(DropDownMenuState(items: newItems));
  }

  void onItemTapResponse(DropDownItem item, bool isDown) {
    final newItems = state.items.map((oldItem) {
      if (oldItem != item) {
        return oldItem;
      }
      item.tapResponseColor = isDown ? AppColors.lightBrown : null;
      return item;
    }).toList();
    emit(DropDownMenuState(items: newItems));
  }

  void onActionTapResponse(
    DropDownItem item,
    DropdownAction action,
    bool isDown,
  ) async {
    final newItems = state.items.map((oldItem) {
      if (oldItem != item) {
        return oldItem;
      }
      final id = item.actions.indexOf(action);
      action.tapResponseColor = isDown ? AppColors.lightBrown : null;
      item.actions[id] = action;
      return item;
    }).toList();
    emit(DropDownMenuState(items: newItems));
  }
}
