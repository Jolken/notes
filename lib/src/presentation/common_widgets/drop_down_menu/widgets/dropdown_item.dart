import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/cubit/dropdown_menu_cubit.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/models/dropdown_item_model.dart';

class DropDownItemWidget extends StatelessWidget {
  const DropDownItemWidget({
    super.key,
    required this.item,
    required this.cubit,
  });

  final DropDownItem item;
  final DropDownMenuCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
            color: item.tapResponseColor ?? item.visualState.background,
            borderRadius: _getBorderRadius(),
          ),
          width: item.visualState.itemWidth,
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(
            horizontal: item.visualState.horizontalPadding,
            vertical: item.visualState.verticalPadding,
          ),
          clipBehavior: Clip.antiAlias,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    AnimatedScale(
                      curve: Curves.easeInOut,
                      scale: item.visualState.scale,
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        item.icon,
                        size: 16,
                        color: AppColors.darkBrown,
                      ),
                    ),
                    SizedBox(width: item.visualState.firstSpace),
                    SizedBox(
                      width: item.visualState.maxTextSpace,
                      child: AnimatedDefaultTextStyle(
                        curve: Curves.easeInOut,
                        style: GoogleFonts.roboto(
                          color: AppColors.darkBrown,
                          fontSize: item.visualState.textSize,
                        ),
                        duration: const Duration(milliseconds: 250),
                        child: Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    AnimatedRotation(
                      turns: _getRotation(),
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 250),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 250),
                        scale: item.visualState.scale,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: AppColors.darkBrown,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          width: item.visualState.itemWidth,
          height: item == cubit.state.items.last || item.isActive ? 0 : 0.1,
          decoration: BoxDecoration(color: item.visualState.dividerColor),
        )
      ],
    );
  }

  BorderRadius _getBorderRadius() {
    if (item.isActive) {
      return const BorderRadius.vertical(
        top: Radius.circular(10.0),
        bottom: Radius.zero,
      );
    } else if (item == cubit.state.items.last) {
      return const BorderRadius.vertical(bottom: Radius.circular(10.0));
    } else if (item == cubit.state.items.first) {
      return const BorderRadius.vertical(top: Radius.circular(10.0));
    }
    return const BorderRadius.all(Radius.zero);
  }

  double _getRotation() {
    return item.isActive ? 0.25 : 0;
  }
}
