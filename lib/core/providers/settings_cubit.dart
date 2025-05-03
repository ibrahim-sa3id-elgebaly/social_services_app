import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_serveces_app/core/providers/settings_state.dart';

import '../cache/cache_helper.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(
    themeMode: ThemeMode.light,
    language: 'en',
  ));

  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    emit(state.copyWith(themeMode: newThemeMode));
  }

  void toggleLanguage() {
    final newLanguage = state.language == 'en' ? 'ar' : 'en';
    emit(state.copyWith(language: newLanguage));
  }

  void changeTheme(ThemeMode newMode) {
    if (newMode == state.themeMode) return;
    emit(state.copyWith(themeMode: newMode));
  }

  void changeLanguage(String newLang) {
    if (newLang == state.language) return;
    emit(state.copyWith(language: newLang));
  }
  void loadLanguagePref() async {
    final lang = await CacheHelper().getData(key: 'language') ?? 'en';
    emit(state.copyWith(language: lang));
  }

}


/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_serveces_app/core/providers/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState(darkMode: false));

  void toggleDarkMode() {
    emit(SettingsState(darkMode: !state.darkMode));
  }

  ThemeMode themeMode = ThemeMode.dark;

  changeTheme(ThemeMode newMode) async {
    if (newMode == themeMode) return;
    themeMode = newMode;

  }

  String language = "en";

  changeLanguage(String newLang) {
    if (newLang == language) return;
    language = newLang;
  }


}
*/
