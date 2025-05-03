import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/api/api_dio/dio_consumer.dart';
import 'package:social_serveces_app/core/cache/cache_helper.dart';
import 'package:social_serveces_app/core/cubit/user_cubit.dart';
import 'package:social_serveces_app/core/providers/settings_cubit.dart';
import 'package:social_serveces_app/core/providers/settings_state.dart';
import 'package:social_serveces_app/core/repositories/user_repository.dart';
import 'package:social_serveces_app/core/style/app_style.dart';
import 'package:social_serveces_app/ui/authentications_screen/forgotten_password/forgotten_password_screen.dart';
import 'package:social_serveces_app/ui/authentications_screen/login/login_screen.dart';
import 'package:social_serveces_app/ui/authentications_screen/register/register_screen.dart';
import 'package:social_serveces_app/ui/home/home_screen.dart';
import 'package:social_serveces_app/ui/home_tap/service/service_screen.dart';
import 'package:social_serveces_app/ui/person_tap/about_us/about_us.dart';
import 'package:social_serveces_app/ui/person_tap/contact_us/contact_us.dart';
import 'package:social_serveces_app/ui/person_tap/editProfile/edit_profile_screen.dart';
import 'package:social_serveces_app/ui/person_tap/settings/settings_screen.dart';
import 'package:social_serveces_app/ui/splash_screens/fifth_screen.dart';
import 'package:social_serveces_app/ui/splash_screens/first_screen.dart';
import 'package:social_serveces_app/ui/splash_screens/fourth_screen.dart';
import 'package:social_serveces_app/ui/splash_screens/second_screen.dart';
import 'package:social_serveces_app/ui/splash_screens/third_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper().init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(UserRepository(api: DioConsumer(dio: Dio())))
            ..loadUserData(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit()..loadLanguagePref(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsCubit, SettingsState, Locale>(
      selector: (state) => state.language == 'ar'
          ? const Locale('ar')
          : const Locale('en'),
      builder: (context, locale) {
        return BlocBuilder<SettingsCubit, SettingsState>(
          buildWhen: (previous, current) => previous.themeMode != current.themeMode,
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(412, 890),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Social Service',
                  theme: AppStyle.lightTheme,
                  darkTheme: AppStyle.darkTheme,
                  themeMode: state.themeMode,
                  locale: locale,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en'), // English
                    Locale('ar'), // Arabic
                  ],
                  localeResolutionCallback: (locale, supportedLocales) {
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode == locale?.languageCode) {
                        return supportedLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  initialRoute: FirstScreen.routeName,
                  routes: {
                    HomeScreen.routeName: (_) => const HomeScreen(),
                    LoginScreen.routeName: (_) =>  LoginScreen(),
                    RegisterScreen.routeName: (_) => RegisterScreen(),
                    ForgottenPasswordScreen.routeName: (_) => const ForgottenPasswordScreen(),
                    ServiceScreen.routeName: (_) => const ServiceScreen(),
                    FirstScreen.routeName: (_) => const FirstScreen(),
                    SecondScreen.routeName: (_) => const SecondScreen(),
                    ThirdScreen.routeName: (_) => const ThirdScreen(),
                    FourthScreen.routeName: (_) => const FourthScreen(),
                    FifthhScreen.routeName: (_) => const FifthhScreen(),
                    SettingsScreen.routeName: (_) => const SettingsScreen(),
                    ContactUs.routeName: (_) =>  ContactUs(),
                    AboutUs.routeName: (_) => AboutUs(),
                    EditProfileScreen.routeName:(_) =>  EditProfileScreen()
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}


/*
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_serveces_app/core/cache/cache_helper.dart';
import 'core/api/api_dio/dio_consumer.dart';
import 'core/cubit/user_cubit.dart';
import 'core/repositories/user_repository.dart';
import 'core/style/app_style.dart';
import 'ui/authentications_screen/forgotten_password/forgotten_password_screen.dart';
import 'ui/authentications_screen/login/login_screen.dart';
import 'ui/authentications_screen/register/register_screen.dart';
import 'ui/home/home_screen.dart';
import 'ui/home_tap/service/service_screen.dart';
import 'ui/person_tap/about_us/about_us.dart';
import 'ui/person_tap/contact_us/contact_us.dart';
import 'ui/person_tap/settings/settings_screen.dart';
import 'ui/splash_screens/fifth_screen.dart';
import 'ui/splash_screens/first_screen.dart';
import 'ui/splash_screens/fourth_screen.dart';
import 'ui/splash_screens/second_screen.dart';
import 'ui/splash_screens/third_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) =>
          UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );
  // 29.0.13113456
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Social Service',
          theme: AppStyle.lightTheme,
          initialRoute: HomeScreen.routeName,
          routes: {
            HomeScreen.routeName:(_)=>const HomeScreen(),
            LoginScreen.routeName:(_)=> LoginScreen(),
            RegisterScreen.routeName:(_)=> RegisterScreen(),
            ForgottenPasswordScreen.routeName:(_)=>const ForgottenPasswordScreen(),
            ServiceScreen.routeName:(_)=>const ServiceScreen(),
            FirstScreen.routeName:(_)=>const FirstScreen(),
            SecondScreen.routeName:(_)=>const SecondScreen(),
            ThirdScreen.routeName:(_)=>const ThirdScreen(),
            FourthScreen.routeName:(_)=>const FourthScreen(),
            FifthhScreen.routeName:(_)=>const FifthhScreen(),
            SettingsScreen.routeName:(_)=>const SettingsScreen(),
            ContactUs.routeName:(_)=>const ContactUs(),
            AboutUs.routeName:(_)=>const AboutUs(),
          },
        );
      },
    );
  }
}
*/
