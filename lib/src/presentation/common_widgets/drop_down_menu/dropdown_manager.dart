import 'package:flutter/material.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/widgets/dropdown_item_list.dart';

//Done only ui part
//TODO interference with the application data

final dropDownWidgetKey = GlobalKey();

class DropDownManagerWidget extends StatefulWidget {
  const DropDownManagerWidget({super.key});

  @override
  State<DropDownManagerWidget> createState() => _DropDownManagerWidgetState();
}

class _DropDownManagerWidgetState extends State<DropDownManagerWidget>
    with TickerProviderStateMixin {
  late OverlayState overlayState;
  OverlayEntry? overlayEntry;
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: dropDownWidgetKey,
      icon: const Icon(
        Icons.more_horiz,
        color: AppColors.darkBrown,
      ),
      onPressed: () {
        _buildDropDownMenu();
      },
      iconSize: 36,
    );
  }

  @override
  void initState() {
    super.initState();
    overlayState = Overlay.of(context);
    animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 350),
      vsync: this,
    );
    animation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      parent: animationController!,
    );
  }

  void _removeHighlightOverlay() async {
    await animationController?.reverse();
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  void dispose() {
    _removeHighlightOverlay();
    animationController?.dispose();
    super.dispose();
  }

  void _buildDropDownMenu() async {
    overlayEntry = OverlayEntry(
      builder: (appContext) {
        return Material(
          color: Colors.transparent,
          child: Align(
            child: DropDownItemListWidget(
              itemAnimation: animation!,
              onClose: _removeHighlightOverlay,
              overlayState: overlayState,
            ),
          ),
        );
      },
    );
    overlayState.insert(overlayEntry!);
    animationController!.forward();
  }
}
