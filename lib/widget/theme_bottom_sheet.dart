import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/providers/settings_cubit.dart';
import '../core/providers/settings_state.dart';
import 'selected_item.dart';
import 'unselected_item.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelectedItem(
                  state.themeMode == ThemeMode.dark ? "Dark" : "Light"),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  context.read<SettingsCubit>().toggleTheme();
                  Navigator.pop(context);
                },
                child: UnSelectedItem(
                    state.themeMode == ThemeMode.dark ? "Light" : "Dark"),
              )
            ],
          ),
        );
      },
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/providers/settings_provider.dart';
import 'selected_item.dart';
import 'unselected_item.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectedItem(settingsProvider.themeMode == ThemeMode.dark
              ? "Dark"
              : "Light"),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeTheme(
                    settingsProvider.themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark);
              },
              child: UnSelectedItem(settingsProvider.themeMode == ThemeMode.dark
                  ? "Light"
                  : "Dark"))
        ],
      ),
    );
  }
}
*/
