import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/settings/settings_cubit.dart';
import '../core/settings/settings_state.dart';
import 'selected_item.dart';
import 'unselected_item.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelectedItem(
                  state.themeMode == ThemeMode.dark ? "Dark" : "Light"),
              SizedBox(height: 20.h),
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
