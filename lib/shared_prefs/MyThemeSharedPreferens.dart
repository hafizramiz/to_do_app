import 'package:shared_preferences/shared_preferences.dart';
class MyThemeSharedPreferens{
     void setTheme(value)async{
     final prefs=await SharedPreferences.getInstance();
     prefs.setBool("themeStatus", value);
   }
   getTheme()async{
     final prefs=await SharedPreferences.getInstance();
     return prefs.getBool("themeStatus")??false;
   }
}