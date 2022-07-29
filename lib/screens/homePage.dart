import 'package:flutter/material.dart';
import 'package:to_do_app/screens/addNewTasksPage.dart';
import 'package:to_do_app/screens/listViewsPage.dart';
import 'package:to_do_app/screens/themeSettingsPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Gorev ekle"),
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (_) => AddNewTaskPage());
        },
        icon: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to themeSettingsScreen
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThemeSettingsPage()));
            },
            icon: Icon(Icons.settings),
          )
        ],
        title: Text("To Do Uygulamasi"),
      ),
      body: ListViewPage(),
    );
  }
}
