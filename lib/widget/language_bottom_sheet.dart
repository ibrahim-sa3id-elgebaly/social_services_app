import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/providers/settings_cubit.dart';
import '../core/providers/settings_state.dart';
import 'selected_item.dart';
import 'unselected_item.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelectedItem(state.language == "ar" ? "العربيه" : "English"),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  context.read<SettingsCubit>().toggleLanguage();
                  Navigator.pop(context);
                },
                child: UnSelectedItem(
                    state.language == "ar" ? "English" : "العربيه"),
              )
            ],
          ),
        );
      },
    );
  }
}

/*
import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../core/providers/settings_provider.dart';
import 'selected_item.dart';
import 'unselected_item.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SelectedItem(
              settingsProvider.language == "ar" ? "العربيه" : "English"),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeLanguage(
                    settingsProvider.language == "ar" ? "en" : "ar");

              },
              child: UnSelectedItem(
                  settingsProvider.language == "ar" ? "English" : "العربيه"))
        ],
      ),
    );
  }
}
*/
