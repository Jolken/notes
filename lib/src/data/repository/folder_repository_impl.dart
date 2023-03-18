import 'package:flutter/material.dart';
import 'package:notes/src/domain/entity/folder.dart';
import 'package:notes/src/domain/repository/folder_repository.dart';
import 'package:notes/src/presentation/app_colors.dart';
import 'package:notes/src/presentation/app_icons.dart';

class MockFolderRepository extends FolderRepository {
  final Map<int, Folder> _folders = {
    0: Folder(
      id: 0,
      name: 'Quick notes',
      background: AppColors.darkBrown,
      icon: const Icon(
        AppIcons.folder,
        size: 28,
        color: AppColors.milkWhite,
      ),
      dateOfCreation: DateTime.now(),
    ),
    1: Folder(
      id: 1,
      name: 'My media',
      background: AppColors.lightGrey,
      icon: const Icon(AppIcons.media, size: 32, color: AppColors.darkBrown),
      dateOfCreation: DateTime.now(),
    ),
    2: Folder(
      id: 2,
      name: 'Music that shazam didn\'t recognize',
      background: AppColors.carmineRed,
      icon: const Icon(
        AppIcons.music,
        size: 34,
        color: AppColors.milkWhite,
      ),
      dateOfCreation: DateTime.now(),
    ),
    3: Folder(
      id: 3,
      name: 'Medicines to buy',
      background: AppColors.sapphireBlue,
      icon: const Icon(
        AppIcons.medicine,
        size: 26,
        color: AppColors.milkWhite,
      ),
      dateOfCreation: DateTime.now(),
    ),
  };

  @override
  Future<void> addFolder(Folder folder) async {
    _folders[_folders.length] = folder;
  }

  @override
  Future<void> deleteFolder(Folder folder) async {
    var key = _folders.values.toList().indexOf(folder);
    while (key < _folders.length - 1) {
      _folders[key] = _folders[key + 1]!;
      key += 1;
    }
    _folders.remove(_folders.length - 1);
  }

  @override
  Future<Map<int, Folder>?> getFolders() async {
    return _folders;
  }

  @override
  Future<void> updateFolder(Folder folder) async {
    _folders.update(
      _folders.values.toList().indexOf(folder),
      (value) => folder,
    );
  }

  @override
  Future<void> updateFoldersOrder(Map<int, Folder> folders) async {
    folders.forEach((key, folder) {
      _folders.update(key, (oldFolder) => folder);
    });
  }
}
