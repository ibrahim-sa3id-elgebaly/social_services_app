import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_serveces_app/core/settings/settings_state.dart';
import '../cache/cache_helper.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    ThemeMode initialThemeMode = ThemeMode.light,
    String initialLanguage = 'en',
  }) : super(SettingsState(
    themeMode: initialThemeMode,
    language: initialLanguage,
  ));

  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    _saveAndEmitTheme(newThemeMode);
  }

  void toggleLanguage() {
    final newLanguage = state.language == 'en' ? 'ar' : 'en';
    _saveAndEmitLanguage(newLanguage);
  }

  void changeTheme(ThemeMode newMode) {
    if (newMode == state.themeMode) return;
    _saveAndEmitTheme(newMode);
  }

  void changeLanguage(String newLang) {
    if (newLang == state.language) return;
    _saveAndEmitLanguage(newLang);
  }

  void loadLanguagePref() async {
    // Language is loaded in main.dart before cubit initialization
    // This method is kept for backward compatibility
  }

  void loadThemePref() async {
    final themeString = CacheHelper.getThemeMode();
    if (themeString != null) {
      final themeMode = themeString == 'dark'
          ? ThemeMode.dark
          : themeString == 'light'
          ? ThemeMode.light
          : ThemeMode.system;
      emit(state.copyWith(themeMode: themeMode));
    }
  }

  // Private helper methods
  void _saveAndEmitTheme(ThemeMode themeMode) {
    final themeString = themeMode == ThemeMode.dark
        ? 'dark'
        : themeMode == ThemeMode.light
        ? 'light'
        : 'system';
    CacheHelper.saveThemeMode(themeString);
    emit(state.copyWith(themeMode: themeMode));
  }

  void _saveAndEmitLanguage(String language) {
    CacheHelper.saveLanguage(language);
    emit(state.copyWith(language: language));
  }
}


/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_serveces_app/core/settings/settings_state.dart';
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
*/
