import 'package:flutter/material.dart';
import 'package:notes/src/presentation/app_styles.dart';
import 'package:notes/src/presentation/common_widgets/drop_down_menu/dropdown_manager.dart';

class BuildAppBar extends StatelessWidget {
  const BuildAppBar({
    super.key,
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
            title: Text('Notes', style: AppStyles.bigBoldTextStyle),
            actions: _appBarActions(),
          ),
        ],
      ),
    );
  }

  List<Widget> _appBarActions() {
    return [
      const DropDownManagerWidget(),
      const SizedBox(width: 10),
    ];
  }
}
