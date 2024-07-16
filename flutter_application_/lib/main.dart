import 'package:flutter/material.dart';

import 'src/todo_list_view.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

//- Seting up SettingsController, which will glue user settings to multiple Flutter Widgets.
void main() async {
  final settingsController = SettingsController(SettingsService());

//- Run the app & pass in the SettingsController that the app listens to for changes.
  runApp(MyApp(settingsController: settingsController));
}

//- MyApp (subclass of StatelessWidget) takes a settingsController as a required parameter and returns a MaterialApp widget with the ToDoListView as the home screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDoListView(),
    );
  }
}