import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 30.h),
      child: InkWell(
        onTap: () => context.pushNamed(Routes.signUp),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${AppStrings.no_account.tr()}  ',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 12.sp)),
              TextSpan(
                text: AppStrings.create_new_account.tr(),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                    fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
