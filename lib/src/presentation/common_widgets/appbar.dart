import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/drop_down_menu.dart';

class BuildAppBar extends PreferredSize {
  const BuildAppBar({
    super.key,
    super.child = const SizedBox(),
    super.preferredSize = const Size(double.infinity, 80),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Notes',
              style: GoogleFonts.acme(
                color: AppColors.darkBrown,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: _appBarActions(),
          ),
        ],
      ),
    );
  }

  List<Widget> _appBarActions() {
    return const [
      DropDownMenuWidget(),
      SizedBox(width: 10),
    ];
  }
}
