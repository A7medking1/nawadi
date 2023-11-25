import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/font_manager.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:flutter/material.dart';

class CustomFontFamily {
  static const String font = 'vazirmatn';
}

ThemeData getAppTheme() {
  return ThemeData(
    fontFamily: CustomFontFamily.font,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      backgroundColor: Colors.white,
      titleTextStyle: getBoldStyle(),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primary,
      indicator: const BoxDecoration(),
      dividerColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      unselectedLabelColor: AppColors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 10.0,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      unselectedIconTheme: IconThemeData(color: Colors.black),
      unselectedItemColor: Colors.black,
    ),
    textTheme: TextTheme(
      displayLarge: getMediumStyle(fontSize: FontSize.s30),
      displayMedium: getRegularStyle(fontSize: FontSize.s24),
      headlineLarge: getSemiBoldStyle(fontSize: FontSize.s30),
      headlineMedium: getRegularStyle(fontSize: FontSize.s24),
      titleMedium: getBoldStyle(fontSize: FontSize.s24),
      titleLarge: getSemiBoldStyle(fontSize: FontSize.s30),
      titleSmall: getBoldStyle(
        fontSize: FontSize.s16,
      ),
      bodyLarge: getBoldStyle(
        color: AppColors.black,
        fontSize: FontSize.s28,
      ),
      bodySmall: getBoldStyle(color: Colors.grey),
      bodyMedium:
          getRegularStyle(color: AppColors.grey, fontSize: FontSize.s20),
      labelSmall: getBoldStyle(
        color: AppColors.primary,
        fontSize: FontSize.s12,
      ),
    ),
  );
}
