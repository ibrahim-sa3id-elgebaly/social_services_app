import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {

  // bool lightModeEnable = true;
  // bool get lightMode => lightModeEnable;
  // set lightModeTheme(bool value){
  //   lightModeEnable=value;
  // }
  // changeTheme() async {
  //   final SharedPreferences preferences = await SharedPreferences.getInstance();
  //   lightModeEnable ?lightModeEnable=false:lightModeEnable=true;
  //   preferences.setBool("lightModeEnable", lightModeEnable);
  //   notifyListeners();
  // }
  // getTheme() async {
  //   final preferences = await SharedPreferences.getInstance();
  //   lightModeTheme = preferences.getBool("lightModeEnable")??true;
  //   notifyListeners();
  // }




  ThemeMode themeMode = ThemeMode.dark;

  changeTheme(ThemeMode newMode) async {
    if (newMode == themeMode) return;
    themeMode = newMode;
    notifyListeners();
  }



  String language = "en";

  changeLanguage(String newLang) {
    if (newLang == language) return;
    language = newLang;
    notifyListeners();
  }
}
