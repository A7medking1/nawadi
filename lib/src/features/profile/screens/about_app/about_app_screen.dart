import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.aboutTheApplication.tr()),
      ),
      body: const AboutAppBody(),
    );
  }
}

class AboutAppBody extends StatelessWidget {
  const AboutAppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.splash,
              fit: BoxFit.cover,
              color: AppColors.primary,
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.versionRelease.tr(),
                  style: getRegularStyle(),
                ),
                Text(
                  '  V2.3',
                  style: getRegularStyle(),
                ),
              ],
            ),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تم التحديث بتاريخ',
                  style: getRegularStyle(),
                ),
                Text(
                  '  24/7/2023',
                  style: getRegularStyle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
