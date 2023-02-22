import 'package:notes/src/domain/entity/folder.dart';
import 'package:notes/src/domain/repository/folder_repository.dart';

class GetFoldersInteractor {
  GetFoldersInteractor(this.folderRepository);

  FolderRepository folderRepository;

  Future<Map<int, Folder>?> call() {
    return folderRepository.getFolders();
  }
}
