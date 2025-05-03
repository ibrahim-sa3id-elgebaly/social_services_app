import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryLightColor,
        )),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.secondaryLightColor,
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
          color:AppColors.secondaryLightColor,
          fontSize: 26.sp,
          fontWeight: FontWeight.w400
      ),
      displayMedium: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black
      ),

    ),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLightColor,
      selectedItemColor: AppColors.secondaryLightColor,
      unselectedItemColor: Color(0xff9B6C59),
      selectedIconTheme: IconThemeData(
        color: AppColors.secondaryLightColor,
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xff9B6C59),
        size: 30,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      primary: AppColors.primaryLightColor,
      secondary: AppColors.secondaryLightColor
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryLightColor,
        )),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.primaryLightColor,
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDarkColor,
      selectedItemColor: AppColors.primaryLightColor,
      unselectedItemColor: Colors.white,
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryLightColor,
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,
      primary: AppColors.primaryDarkColor,
      secondary: AppColors.secondaryLightColor,
    ),
    useMaterial3: true,
  );
}
