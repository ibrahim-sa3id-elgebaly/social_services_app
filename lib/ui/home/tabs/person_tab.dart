import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/cubit/user/user_cubit.dart';
import 'package:social_serveces_app/core/cubit/user/user_state.dart';
import 'package:social_serveces_app/ui/person_tap/editProfile/edit_profile_screen.dart';
import '../../../widget/custom_button_settings.dart';
import '../../../widget/profile_header.dart';
import '../../authentications_screen/login/login_screen.dart';
import '../../person_tap/about_us/about_us.dart';
import '../../person_tap/contact_us/contact_us.dart';
import '../../person_tap/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonTab extends StatefulWidget {
  const PersonTab({super.key});

  @override
  State<PersonTab> createState() => _PersonTabState();
}

class _PersonTabState extends State<PersonTab> {
  @override
  void initState() {
    super.initState();
    // Load user data when the tab is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserCubit>().loadUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state) {
              if (state is GetUserFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errMessage),
                    duration: const Duration(seconds: 0),
                  ),
                );
              }
            },
            builder: (context, state) {
              // Handle loading state
              if (state is GetUserLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              // Handle error state
              if (state is GetUserFailure) {
                return ProfileHeader(
                  name: '',
                  email: '',
                  onClick: () {
                    Navigator.of(context).pushNamed(EditProfileScreen.routeName);
                  },
                );
              }
              // Handle success state
              if (state is GetUserSuccess) {
                return ProfileHeader(
                  name: '${state.user.firstName} ${state.user.lastName}',
                  email: state.user.email,
                  onClick: () {
                    Navigator.of(context).pushNamed(EditProfileScreen.routeName);
                  },
                );
              }

              // Initial state - try to get cached data
              final firstName = context.read<UserCubit>().signUpFirstName.text;
              final lastName = context.read<UserCubit>().signUpLastName.text;
              final email = context.read<UserCubit>().signUpEmail.text;
              return ProfileHeader(
                name: firstName.isNotEmpty && lastName.isNotEmpty
                    ? '$firstName $lastName'
                    : 'Guest User',
                email: email.isNotEmpty
                    ? email
                    : 'Guest Email',
                onClick: () {
                  Navigator.of(context).pushNamed(EditProfileScreen.routeName);
                },
              );
            },
          ),
          SizedBox(height: 28.h),
          const Divider(),
          SizedBox(height: 18.h),
          CustomButtonSettings(
            icon: Icons.settings,
            iconName: AppLocalizations.of(context)!.settings,
            onTap: () {
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
          ),
          SizedBox(height: 28.h),
          CustomButtonSettings(
            icon: Icons.mark_email_unread_sharp,
            iconName: AppLocalizations.of(context)!.contact_us,
            onTap: () {
              Navigator.pushNamed(context, ContactUs.routeName);
            },
          ),
          SizedBox(height: 28.h),
          CustomButtonSettings(
            icon: Icons.info_outline_rounded,
            iconName: AppLocalizations.of(context)!.about_us,
            onTap: () {
              Navigator.pushNamed(context, AboutUs.routeName);
            },
          ),
          const Spacer(),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is LogoutLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return CustomButtonSettings(
                icon: Icons.logout,
                iconName: AppLocalizations.of(context)!.log_out,
                onTap: () {
                  context.read<UserCubit>().logout().then((_) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreen.routeName,
                          (Route<dynamic> route) => false,
                    );
                  });
                },
              );
            },
          ),
          SizedBox(height: 28.h),
        ],
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/cubit/user_cubit.dart';
import 'package:social_serveces_app/core/cubit/user_state.dart';
import 'package:social_serveces_app/ui/person_tap/editProfile/edit_profile_screen.dart';
import '../../../widget/custom_button_settings.dart';
import '../../../widget/profile_header.dart';
import '../../authentications_screen/login/login_screen.dart';
import '../../person_tap/about_us/about_us.dart';
import '../../person_tap/contact_us/contact_us.dart';
import '../../person_tap/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonTab extends StatefulWidget {
  const PersonTab({super.key});

  @override
  State<PersonTab> createState() => _PersonTabState();
}

class _PersonTabState extends State<PersonTab> {

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().loadUserData(); // هنا
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          BlocConsumer<UserCubit, UserState>(
            listener: (context, state){
              if(state is GetUserFailure){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errMessage),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is GetUserLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is GetUserFailure) {
                return ProfileHeader(
                  name: 'Error loading profile',
                  email: '...',
                  onClick: () {
                    Navigator.of(context).pushNamed(EditProfileScreen.routeName);
                  },
                );
              }
              if (state is GetUserSuccess) {
                final user = state.user;
                return ProfileHeader(
                  name: '${user.firstName} ${user.lastName}',
                  email: "${user.email}",
                  onClick: () {
                    Navigator.of(context).pushNamed(EditProfileScreen.routeName);
                  },
                );
              }
              return ProfileHeader(
                name: '',
                email: '',
                onClick: () {
                  Navigator.of(context).pushNamed(EditProfileScreen.routeName);
                },
              );
            },
          ),
          SizedBox(height: 28.h),
          const Divider(),
          SizedBox(height: 18.h),
          CustomButtonSettings(
            icon: Icons.settings,
            iconName: AppLocalizations.of(context)!.settings,
            onTap: () {
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
          ),
          SizedBox(height: 28.h),
          CustomButtonSettings(
            icon: Icons.mark_email_unread_sharp,
            iconName: AppLocalizations.of(context)!.contact_us,
            onTap: () {
              Navigator.pushNamed(context, ContactUs.routeName);
            },
          ),
          SizedBox(height: 28.h),
          CustomButtonSettings(
            icon: Icons.info_outline_rounded,
            iconName: AppLocalizations.of(context)!.about_us,
            onTap: () {
              Navigator.pushNamed(context, AboutUs.routeName);
            },
          ),
          const Spacer(),
          CustomButtonSettings(
            icon: Icons.logout,
            iconName: AppLocalizations.of(context)!.log_out,
            onTap: () {
              context.read<UserCubit>().logout();
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                    (Route<dynamic> route) => false,
              );
            },
          ),
          SizedBox(height: 28.h),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/cache/cache_helper.dart';
import 'package:social_serveces_app/core/cubit/user_cubit.dart';
import 'package:social_serveces_app/ui/person_tap/editProfile/edit_profile_screen.dart';
import '../../../core/cubit/user_state.dart';
import '../../../widget/custom_button_settings.dart';
import '../../../widget/profile_header.dart';
import '../../authentications_screen/login/login_screen.dart';
import '../../person_tap/about_us/about_us.dart';
import '../../person_tap/contact_us/contact_us.dart';
import '../../person_tap/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonTab extends StatefulWidget {
  const PersonTab({super.key});

  @override
  State<PersonTab> createState() => _PersonTabState();
}

class _PersonTabState extends State<PersonTab> {
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    final firstName = CacheHelper().getData(key: 'firstName') ?? '';
    final lastName = CacheHelper().getData(key: 'lastName') ?? '';
    email = CacheHelper().getData(key: 'email') ?? '';
    setState(() {
      name = '$firstName $lastName';
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginScreen.routeName,
            (Route<dynamic> route) => false,
          );
        }
        if (state is LogoutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: REdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              ProfileHeader(
                name: name,
                email: email,
                onClick: () {
                  Navigator.of(context).pushNamed(EditProfileScreen.routeName);
                },
              ),
              SizedBox(height: 28.h),
              const Divider(),
              SizedBox(height: 18.h),
              CustomButtonSettings(
                icon: Icons.settings,
                iconName: AppLocalizations.of(context)!.settings,
                onTap: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
              ),
              SizedBox(height: 28.h),
              CustomButtonSettings(
                icon: Icons.mark_email_unread_sharp,
                iconName: AppLocalizations.of(context)!.contact_us,
                onTap: () {
                  Navigator.pushNamed(context, ContactUs.routeName);
                },
              ),
              SizedBox(height: 28.h),
              CustomButtonSettings(
                icon: Icons.info_outline_rounded,
                iconName: AppLocalizations.of(context)!.about_us,
                onTap: () {
                  Navigator.pushNamed(context, AboutUs.routeName);
                },
              ),
              const Spacer(),
              state is LogoutLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButtonSettings(
                      icon: Icons.logout,
                      iconName: AppLocalizations.of(context)!.log_out,
                      onTap: () {
                        context.read<UserCubit>().logout();
                      },
                    ),
              SizedBox(height: 28.h),
            ],
          ),
        );
      },
    );
  }
}
*/
