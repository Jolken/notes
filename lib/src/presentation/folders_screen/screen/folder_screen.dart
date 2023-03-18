import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/dependencies/di.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/app_icons.dart';
import 'package:notes/src/presentation/common_widgets/appbar.dart';
import 'package:notes/src/presentation/common_widgets/appbar_list_data.dart';
import 'package:notes/src/presentation/common_widgets/circle_progress_indicator.dart';
import 'package:notes/src/presentation/common_widgets/floating_action_button.dart';
import 'package:notes/src/presentation/folders_screen/cubit/folder_page_cubit.dart';
import 'package:notes/src/presentation/folders_screen/cubit/folder_page_state.dart';

class FolderScreen extends StatelessWidget {
  const FolderScreen({super.key});

  static const screenName = 'folder_screen';

  @override
  Widget build(BuildContext context) {
    late final FolderPageCubit cubit;
    late final Future<void> future;
    cubit = DI.getInstance().folderPageCubit;
    future = cubit.onScreenLoad();
    return BlocBuilder<FolderPageCubit, FolderPageState>(
      bloc: cubit,
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: AppColors.milkWhite,
          floatingActionButton: AppFloatingActionButton(
            icon: AppIcons.addFolder,
            onTap: () {},
          ),
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 80),
            child: BuildAppBar(),
          ),
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      AppBarListData(
                        title: '${state.folders.length} folders',
                      ),
                      const SizedBox(height: 5),
                      _buildFolderList(state, cubit),
                    ],
                  );
                } else {
                  return const CircleProgressIndicatorWidget();
                }
              },
            ),
          ),
        );
      },
    );
  }

  Expanded _buildFolderList(FolderPageState state, FolderPageCubit cubit) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 20,
        ),
        child: DragAndDropLists(
          onItemReorder: (
            int oldItemIndex,
            int oldListIndex,
            int newItemIndex,
            int newListIndex,
          ) {
            cubit.onItemDragged(oldItemIndex, newItemIndex);
          },
          onListReorder: (int oldListIndex, int newListIndex) {},
          children: [
            DragAndDropList(
              children: state.folderWidgets
                  .map((folderWidget) => DragAndDropItem(child: folderWidget))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
