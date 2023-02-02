import 'package:flutter/cupertino.dart';
import 'package:notes/src/presentation/folders_screen/screen/folder_screen.dart';

class AppNavigation {
  final initialRoute = FolderScreen.screenName;

  final routes = <String, Widget Function(BuildContext)>{
    FolderScreen.screenName: (context) => const FolderScreen()
  };
}
