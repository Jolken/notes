import 'package:notes/src/data/repository/folder_repository_impl.dart';
import 'package:notes/src/domain/repository/folder_repository.dart';
import 'package:notes/src/domain/use_case/folder_case/add_folder_interactor.dart';
import 'package:notes/src/domain/use_case/folder_case/delete_folder_interactor.dart';
import 'package:notes/src/domain/use_case/folder_case/get_folders_interactor.dart';
import 'package:notes/src/domain/use_case/folder_case/update_folder_interactor.dart';
import 'package:notes/src/domain/use_case/folder_case/update_folders_order_interactor.dart';
import 'package:notes/src/presentation/folders_screen/cubit/folder_page_cubit.dart';

class DI {
  DI._();

  static DI? _instance;

  late FolderRepository folderRepository;
  late GetFoldersInteractor _getFoldersInteractor;
  late AddFolderInteractor _addFolderInteractor;
  late UpdateFolderInteractor _updateFolderInteractor;
  late DeleteFolderInteractor _deleteFolderInteractor;
  late UpdateFoldersOrderInteractor _updateFoldersOrderInteractor;
  late FolderPageCubit folderPageCubit;

  static DI getInstance() {
    return _instance ?? (_instance = DI._());
  }

  Future<void> init() async {
    folderRepository = MockFolderRepository();
    _getFoldersInteractor = GetFoldersInteractor(folderRepository);
    _addFolderInteractor = AddFolderInteractor(folderRepository);
    _updateFolderInteractor = UpdateFolderInteractor(folderRepository);
    _deleteFolderInteractor = DeleteFolderInteractor(folderRepository);
    _updateFoldersOrderInteractor =
        UpdateFoldersOrderInteractor(folderRepository);
    folderPageCubit = FolderPageCubit(
      _getFoldersInteractor,
      _addFolderInteractor,
      _updateFolderInteractor,
      _deleteFolderInteractor,
      _updateFoldersOrderInteractor,
    );
  }
}
