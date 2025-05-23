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
