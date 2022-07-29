import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/datalar/myTasksProvider.dart';
import 'package:to_do_app/datalar/themeSettingsProvider.dart';

import 'screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Theme information
  ThemeData orangeTheme = ThemeData(
    appBarTheme: AppBarTheme(color: Colors.orange),
    accentColor: Colors.orange,
  );

  ThemeData greenTheme = ThemeData(
    appBarTheme: AppBarTheme(color: Colors.teal),
    accentColor: Colors.teal,
  );

  // diff with branches
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeSettingsProvider>(
          create: (context) => ThemeSettingsProvider.Named(),
        ),
        ChangeNotifierProvider(create: (context) => MyTasksProvider())
      ],
      child: Consumer2<ThemeSettingsProvider, MyTasksProvider>(
          builder: (context, object1, object2, child) {
        // object2.getTask();
        return MaterialApp(
          theme: object1.themeStatus ? orangeTheme : greenTheme,
          home: HomePage(),
        );
      }),
    );
  }
}
