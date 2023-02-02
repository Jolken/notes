import 'package:flutter/material.dart';
import 'package:notes/src/presentation/app_styles.dart';

class AppBarListData extends StatelessWidget {
  const AppBarListData({
    required this.title,
    this.folderName,
    super.key,
  });

  final String title;
  final String? folderName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 30,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.smallTextStyle,
          ),
          Expanded(
            child: Text(
              folderName ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.smallTextStyle,
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
