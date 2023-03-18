import 'package:flutter/material.dart';
import 'package:notes/src/presentation/app_colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      elevation: 0,
      highlightElevation: 0,
      backgroundColor: Colors.transparent,
      child: Icon(
        icon,
        size: 34,
        color: AppColors.darkBrown,
      ),
    );
  }
}
