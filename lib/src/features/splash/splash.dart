import 'dart:async';

import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppPreferences _preferences = sl<AppPreferences>();

  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 1), () => _goNext());
  }

  _goNext() async {
    final isOnBoarding = _preferences.isOnBoardingInPrefs();

    final isUserLoggedIn = _preferences.isUserLoggedIn();
    final isUserSkipLogin = _preferences.isSkipLogin();

    if (isUserSkipLogin || isUserLoggedIn) {
      context.goNamed(Routes.home);
    } else {
      if (isOnBoarding) {
        context.goNamed(Routes.signIn);
      } else {
        context.goNamed(Routes.onBoarding);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200.w,
              height: 200.h,
              child: Image.asset(
                AppImages.splash,
              ),
            ),
            Text(
              AppStrings.splashTitle.tr(),
              style: getBoldStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
