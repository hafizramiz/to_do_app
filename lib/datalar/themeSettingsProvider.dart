import 'package:flutter/material.dart';
import 'package:to_do_app/shared_prefs/MyThemeSharedPreferens.dart';

class ThemeSettingsProvider extends ChangeNotifier{

  MyThemeSharedPreferens myThemeSharedPreferens=MyThemeSharedPreferens();
  late bool themeStatus;
  ThemeSettingsProvider.Named(){
    themeStatus=true;
    getPreference();
  }
  //Setter themeStatus
  void changeThemeStatus(value)async{
    themeStatus=value;
    myThemeSharedPreferens.setTheme(value);
    notifyListeners();
  }
  void getPreference() async {
   themeStatus= await myThemeSharedPreferens.getTheme();
    notifyListeners();
  }
}