import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes/src/domain/entity/folder.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/common_widgets/slidable_action.dart';
import 'package:notes/src/presentation/folders_screen/cubit/folder_page_cubit.dart';
import 'package:notes/src/presentation/folders_screen/screen/folder_widget.dart';

class FolderActionsWidget extends StatelessWidget {
  const FolderActionsWidget({
    super.key,
    required this.folder,
    required this.cubit,
  });

  final FolderPageCubit cubit;
  final Folder folder;

  @override
  Widget build(BuildContext context) {
    return Scrollable(
      viewportBuilder: (BuildContext context, ViewportOffset position) =>
          Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            extentRatio: 0.5,
            children: [
              SlidableActionWidget(
                icon: Icons.edit_outlined,
                color: AppColors.brightBlue,
                onTap: () {},
              ),
              SlidableActionWidget(
                icon: Icons.delete_outline,
                color: AppColors.carmineRed,
                onTap: () {
                  cubit.onDeleteFolderClick(folder);
                },
              ),
            ],
          ),
          child: FolderWidget(
            folder: folder,
          ),
        ),
      ),
    );
  }
}
