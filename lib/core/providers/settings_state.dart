import 'package:flutter/material.dart';

class SettingsState {
  final ThemeMode themeMode;
  final String language;

  const SettingsState({
    required this.themeMode,
    required this.language,
  });

  SettingsState copyWith({
    ThemeMode? themeMode,
    String? language,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
    );
  }
}

/*
class SettingsState {}

final class ThemeDark extends SettingsState {}

final class ThemeLight extends SettingsState {}

final class LanguageArabic extends SettingsState {}

final class LanguageEnglish extends SettingsState {}
*/
