import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/src/dependencies/settings.dart';
import 'package:notes/src/domain/entity/folder.dart';
import 'package:notes/src/domain/use_case/folder_case/add_folder_interactor.dart';
import 'package:notes/src/domain/use_case/folder_case/delete_folder_interactor.dart';
import 'package:notes/src/domain/use_case/folder_case/get_folders_interactor.dart';
import 'package:notes/src/domain/use_case/folder_case/update_folder_interactor.dart';
import 'package:notes/src/domain/use_case/folder_case/update_folders_order_interactor.dart';
import 'package:notes/src/presentation/folders_screen/screen/folder_widget_actions.dart';

import 'folder_page_state.dart';

class FolderPageCubit extends Cubit<FolderPageState> {
  FolderPageCubit(
    this._getFoldersInteractor,
    this._addFolderInteractor,
    this._updateFolderInteractor,
    this._deleteFolderInteractor,
    this._updateFoldersOrderInteractor,
  ) : super(
          FolderPageState(
            sortBy: Settings.date.name,
            sortOrder: Settings.descending.name,
            folderWidgets: [],
            folders: {},
          ),
        );

  final GetFoldersInteractor _getFoldersInteractor;
  final AddFolderInteractor _addFolderInteractor;
  final UpdateFolderInteractor _updateFolderInteractor;
  final DeleteFolderInteractor _deleteFolderInteractor;
  final UpdateFoldersOrderInteractor _updateFoldersOrderInteractor;

  void _copyWith({
    String? sortBy,
    String? sortOrder,
    List<FolderActionsWidget>? folderWidgets,
    Map<int, Folder>? folders,
  }) {
    emit(
      FolderPageState(
        sortBy: sortBy ?? state.sortBy,
        sortOrder: sortOrder ?? state.sortOrder,
        folderWidgets: folderWidgets ?? state.folderWidgets,
        folders: folders ?? state.folders,
      ),
    );
  }

  Future<void> onScreenLoad() async {
    final folders = await _getFoldersInteractor() ?? {};
    List<FolderActionsWidget> folderWidgets = [];
    folders.forEach((key, folder) {
      folderWidgets.add(
        FolderActionsWidget(
          key: ValueKey(folder.id),
          folder: folder,
          cubit: this,
        ),
      );
    });
    _copyWith(folders: folders, folderWidgets: folderWidgets);
  }

  void onAddFolderClick(Folder folder) {
    _addFolderInteractor(folder);
    onScreenLoad();
  }

  void onUpdateFolderClick(Folder folder) {
    _updateFolderInteractor(folder);
    onScreenLoad();
  }

  void onDeleteFolderClick(folder) {
    _deleteFolderInteractor(folder);
    onScreenLoad();
  }

  void _updateFoldersOrder(Map<int, Folder> folders) {
    _updateFoldersOrderInteractor(folders);
    onScreenLoad();
  }

  void onItemDragged(int oldItemIndex, int newItemIndex) {
    final removedValue = state.folderWidgets.removeAt(oldItemIndex);
    final listOfWidgets = state.folderWidgets;
    listOfWidgets.insert(newItemIndex, removedValue);
    Map<int, Folder> foldersMap = {};
    for (var element in listOfWidgets) {
      foldersMap[foldersMap.length] = element.folder;
    }
    _updateFoldersOrder(foldersMap);
  }
}
