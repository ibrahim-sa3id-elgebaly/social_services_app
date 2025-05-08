import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/ui/person_tap/editProfile/edit_profile_screen.dart';
import '../../../widget/custom_button_settings.dart';
import '../../../widget/profile_header.dart';
import '../../authentications_screen/login/login_screen.dart';
import '../../person_tap/about_us/about_us.dart';
import '../../person_tap/contact_us/contact_us.dart';
import '../../person_tap/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonTab extends StatelessWidget {
  const PersonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          ProfileHeader(onClick: () {
            Navigator.of(context).pushNamed(EditProfileScreen.routeName);
          },),
          SizedBox(height: 28.h),
          Divider(),
          SizedBox(height: 18.h),
          CustomButtonSettings(
            icon: Icons.settings,
            iconName: AppLocalizations.of(context)!.settings,
            onTap: (){
            Navigator.pushNamed(context, SettingsScreen.routeName);
          },),
          SizedBox(height: 28.h),
          CustomButtonSettings(
            icon: Icons.mark_email_unread_sharp,
            iconName: AppLocalizations.of(context)!.contact_us,
            onTap: (){
              Navigator.pushNamed(context, ContactUs.routeName);
            },),
          SizedBox(height: 28.h),
          CustomButtonSettings(
            icon: Icons.info_outline_rounded,
            iconName: AppLocalizations.of(context)!.about_us,
            onTap: (){
              Navigator.pushNamed(context, AboutUs.routeName);
            },),
          Spacer(),
          CustomButtonSettings(
            icon: Icons.logout,
            iconName: AppLocalizations.of(context)!.log_out,
            onTap: (){
            Navigator.pushNamed(context, LoginScreen.routeName);
          },),
          SizedBox(height: 28.h),
        ],
      ),
    );
  }

}


