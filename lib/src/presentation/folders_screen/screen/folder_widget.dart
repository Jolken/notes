import 'package:flutter/material.dart';
import 'package:notes/src/domain/entity/folder.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/app_styles.dart';

class FolderWidget extends StatelessWidget {
  const FolderWidget({
    super.key,
    required this.folder,
  });

  final Folder folder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: AppColors.white,
      ),
      padding: EdgeInsets.zero,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: Container(
          height: double.maxFinite,
          width: 58,
          decoration: BoxDecoration(
            color: folder.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: folder.icon,
        ),
        title: Text(folder.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.middleBolderTextStyle),
        trailing: Container(
          height: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(8),
              left: Radius.zero,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.drag_handle_rounded,
              size: 20,
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
