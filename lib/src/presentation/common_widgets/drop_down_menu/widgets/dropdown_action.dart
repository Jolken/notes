import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/models/dropdown_action_model.dart';

class DropDownActionWidget extends StatelessWidget {
  const DropDownActionWidget({super.key, required this.action});

  final DropdownAction action;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: action.tapResponseColor ?? AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.2),
        child: SizedBox(
          width: 200,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                action.icon,
                size: 16,
              ),
              const SizedBox(
                width: 8.0,
              ),
              SizedBox(
                width: 130,
                child: Text(
                  action.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.roboto(
                    color: AppColors.darkBrown,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              AnimatedCrossFade(
                firstChild: const Row(
                  children: [
                    Icon(
                      Icons.done_rounded,
                      size: 14,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                crossFadeState: action.isSelected
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                secondChild: Container(),
                duration: const Duration(milliseconds: 150),
              )
            ],
          ),
        ),
      ),
    );
  }
}
