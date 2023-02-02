import 'package:notes/src/domain/entity/folder.dart';

abstract class FolderRepository {
  Future<Map<int, Folder>?> getFolders();

  Future<void> addFolder(Folder folder);

  Future<void> updateFolder(Folder folder);

  Future<void> deleteFolder(Folder folder);

  Future<void> updateFoldersOrder(Map<int, Folder> folders);
}
