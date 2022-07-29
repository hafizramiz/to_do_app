import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/datalar/themeSettingsProvider.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tema Ayarlari"),
      ),
      body: Consumer<ThemeSettingsProvider>(
        builder: (context, nesne, child) => SwitchListTile(
          value: nesne.themeStatus,
          onChanged: (value) {
            nesne.changeThemeStatus(value);
          },
          title: Text("Tema Değiştir"),
          subtitle: Text("${nesne.themeStatus? "Sari":"Yeşil"}"),
        ),
      ),
    );
  }
}
