import 'package:notes/src/dependencies/settings.dart';
import 'package:notes/src/domain/entity/folder.dart';
import 'package:notes/src/presentation/folders_screen/screen/folder_widget_actions.dart';

class FolderPageState {
  FolderPageState({
    required this.sortBy,
    required this.sortOrder,
    required this.folderWidgets,
    required this.folders,
  });

  Map<int, Folder> folders;
  List<FolderActionsWidget> folderWidgets;
  String sortBy = Settings.date.name;
  String sortOrder = Settings.descending.name;
}
