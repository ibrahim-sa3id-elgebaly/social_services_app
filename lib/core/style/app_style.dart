import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryLightColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.secondaryLightColor),
        titleTextStyle: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryLightColor,
        )),
    textTheme: TextTheme(
      headlineMedium: const TextStyle(
        color: AppColors.secondaryLightColor,
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
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
    scaffoldBackgroundColor: AppColors.scaffoldLightColor,
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
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.scaffoldLightColor
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: AppColors.primaryLightColor,
      secondary: AppColors.secondaryLightColor,
      onPrimary: AppColors.onPrimaryLightColor,
      background: AppColors.scaffoldLightColor,
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryDarkColor,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.secondaryDarkColor),
        titleTextStyle: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.secondaryDarkColor,
        )),
    textTheme: TextTheme(
      headlineMedium: const TextStyle(
        color: AppColors.secondaryDarkColor,
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
          color: AppColors.secondaryDarkColor,
          fontSize: 26.sp,
          fontWeight: FontWeight.w400),
      displayMedium: TextStyle(
          fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDarkColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.black,
        size: 30,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.scaffoldDarkColor
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      primary: AppColors.primaryDarkColor,
      secondary: AppColors.secondaryDarkColor,
      onPrimary: AppColors.onPrimaryDarkColor,
      background: AppColors.scaffoldDarkColor,
    ),
    useMaterial3: true,
  );
}
