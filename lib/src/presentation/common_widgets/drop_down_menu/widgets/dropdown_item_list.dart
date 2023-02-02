import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/cubit/dropdown_menu_cubit.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/cubit/dropdown_menu_state.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/dropdown_manager.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/models/dropdown_action_model.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/models/dropdown_item_model.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/widgets/dropdown_action_list.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/widgets/dropdown_item.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/widgets/widget_offset_key.dart';

class DropDownItemListWidget extends StatefulWidget {
  const DropDownItemListWidget({
    super.key,
    required this.onClose,
    required this.overlayState,
    required this.itemAnimation,
  });

  final VoidCallback onClose;
  final OverlayState overlayState;
  final Animation<double> itemAnimation;

  @override
  State<DropDownItemListWidget> createState() => _DropDownItemListWidgetState();
}

class _DropDownItemListWidgetState extends State<DropDownItemListWidget>
    with SingleTickerProviderStateMixin {
  late final DropDownMenuCubit cubit;
  OverlayEntry? overlayEntry;
  AnimationController? animationController;
  Animation<double>? actionAnimation;
  late BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownMenuCubit, DropDownMenuState>(
      bloc: cubit,
      builder: (BuildContext context, state) {
        return GestureDetector(
          onTap: widget.onClose,
          child: FadeTransition(
            opacity: widget.itemAnimation,
            child: Scaffold(
              backgroundColor: AppColors.black.withOpacity(0.04),
              body: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: _getOffset(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    clipBehavior: Clip.antiAlias,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: borderRadius,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: cubit.state.items
                          .map(
                            (item) => GestureDetector(
                              onTap: () {
                                _onTap(item);
                              },
                              onTapDown: (details) {
                                cubit.onItemTapResponse(item, true);
                              },
                              onTapUp: (details) {
                                _onTapEnd(item);
                              },
                              onTapCancel: () {
                                _onTapEnd(item);
                              },
                              child: SizeTransition(
                                sizeFactor: widget.itemAnimation,
                                axis: Axis.vertical,
                                axisAlignment: -1.0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: DropDownItemWidget(
                                    item: item,
                                    cubit: cubit,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 350),
      vsync: this,
    );
    actionAnimation = CurvedAnimation(
      curve: Curves.easeInOut,
      parent: animationController!,
    );
    cubit = DropDownMenuCubit([
      DropDownItem(
        title: 'Sort by',
        icon: Icons.sort_rounded,
        actions: [
          DropdownAction(
            title: 'date',
            onTap: () {},
            isSelected: true,
            icon: Icons.date_range_rounded,
          ),
          DropdownAction(
            title: 'name',
            onTap: () {},
            isSelected: false,
            icon: Icons.abc,
          ),
        ],
      ),
      DropDownItem(
        title: 'Sort order',
        icon: Icons.swap_vert_rounded,
        actions: [
          DropdownAction(
            title: 'descending',
            onTap: () {},
            isSelected: true,
            icon: Icons.arrow_downward_rounded,
          ),
          DropdownAction(
            title: 'ascending',
            onTap: () {},
            isSelected: false,
            icon: Icons.arrow_upward_rounded,
          ),
        ],
      ),
      DropDownItem(
        title: 'Change theme',
        icon: Icons.brightness_4,
        actions: [
          DropdownAction(
            title: 'light',
            onTap: () {},
            isSelected: true,
            icon: Icons.light_mode_rounded,
          ),
          DropdownAction(
            title: 'dark',
            onTap: () {},
            isSelected: false,
            icon: Icons.dark_mode_rounded,
          ),
        ],
      ),
    ]);
    borderRadius = const BorderRadius.all(Radius.circular(10.0));
  }

  @override
  void dispose() {
    _removeHighlightOverlay();
    animationController?.dispose();
    super.dispose();
  }

  EdgeInsets _getOffset() {
    final offset = dropDownWidgetKey.globalPaintBounds!;
    return EdgeInsets.fromLTRB(0.0, offset.top.toDouble(), 19.6, 0.0);
  }

  void _buildDropDownAction(DropDownActionListWidget actionsWidget) {
    overlayEntry = OverlayEntry(
      builder: (appContext) {
        return FutureBuilder(
          future: Future.delayed(const Duration(milliseconds: 300)),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              animationController!.forward();
              return actionsWidget;
            } else {
              return Container();
            }
          },
        );
      },
    );
    widget.overlayState.insert(overlayEntry!);
  }

  void _removeHighlightOverlay() async {
    await animationController?.reverse();
    overlayEntry?.remove();
    overlayEntry = null;
    cubit.uncheckItem();
    _setRoundedCorners();
  }

  void _setRectangleBorders() {
    if (borderRadius !=
        const BorderRadius.vertical(top: Radius.circular(10.0))) {
      borderRadius = const BorderRadius.vertical(top: Radius.circular(10.0));
      setState(() {});
    }
  }

  void _setRoundedCorners() {
    if (borderRadius != const BorderRadius.all(Radius.circular(10.0))) {
      borderRadius = const BorderRadius.all(Radius.circular(10.0));
      setState(() {});
    }
  }

  Future<void> _onTap(DropDownItem item) async {
    await Future.delayed(
      const Duration(milliseconds: 150),
    );
    cubit.onItemClick(item);
    if (item == cubit.state.items.last) {
      _setRectangleBorders();
    }
    _buildDropDownAction(
      DropDownActionListWidget(
        item: item,
        cubit: cubit,
        onClose: _removeHighlightOverlay,
        animation: actionAnimation!,
      ),
    );
  }

  void _onTapEnd(DropDownItem item) {
    Future.delayed(
      const Duration(milliseconds: 100),
    ).whenComplete(() {
      cubit.onItemTapResponse(item, false);
    });
  }
}
