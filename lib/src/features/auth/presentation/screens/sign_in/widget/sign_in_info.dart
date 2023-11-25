import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInInfo extends StatelessWidget {
  const SignInInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: Image.asset(
            AppImages.splash,
            color: AppColors.primary,
          ),
        ),
        24.verticalSpace,
        Text(
          AppStrings.welcome_to_wasmi.tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18.sp
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          AppStrings.please_log_in_from_here.tr(),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: AppColors.grey,
            fontSize: 13.sp
          ),
        ),
      ],
    );
  }
}
