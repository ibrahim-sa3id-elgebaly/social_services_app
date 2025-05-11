import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/providers/settings_cubit.dart';
import '../../../core/providers/settings_state.dart';
import '../../../core/style/app_colors.dart';
import '../../../widget/language_bottom_sheet.dart';
import '../../../widget/theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "SettingsScreen";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.settings),
          ),
          body: Padding(
            padding: REdgeInsets.symmetric(vertical: 10, horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const LanguageBottomSheet(),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: REdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onPrimary),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Text(
                      state.language == "ar" ? "العربيه" : "English",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const ThemeBottomSheet(),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onPrimary),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      state.themeMode == ThemeMode.dark ? "Dark" : "Light",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/providers/settings_provider.dart';
import '../../../core/style/app_colors.dart';
import '../../../widget/language_bottom_sheet.dart';
import '../../../widget/theme_bottom_sheet.dart';
class SettingsScreen extends StatelessWidget {
  static const String routeName = "SettingsScreen";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
//    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLightColor,
        title: const Text("Settings"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Language",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => LanguageBottomSheet(),
                );
              },
              child: Container(
                width: double.infinity,
                padding: REdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  settingsProvider.language == "ar" ? "العربيه" : "English",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Theme",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => ThemeBottomSheet(),
                );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  settingsProvider.themeMode == ThemeMode.dark ? "Dark" : "Light",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
