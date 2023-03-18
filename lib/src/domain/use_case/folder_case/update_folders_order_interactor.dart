import 'package:notes/src/domain/entity/folder.dart';
import 'package:notes/src/domain/repository/folder_repository.dart';

class UpdateFoldersOrderInteractor {
  UpdateFoldersOrderInteractor(this.folderRepository);

  FolderRepository folderRepository;

  Future<void> call(Map<int, Folder> folders) async {
    await folderRepository.updateFoldersOrder(folders);
  }
}
