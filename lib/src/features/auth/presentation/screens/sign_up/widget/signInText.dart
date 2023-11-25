import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInText extends StatelessWidget {
  const SignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 30.h),
      child: InkWell(
        onTap: () => context.pop(),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${AppStrings.are_you_have_account.tr()}  ',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 12.sp,
                )
              ),
              TextSpan(
                text: AppStrings.sign_in.tr(),
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.primary,
                  fontSize: 13,
                  decoration: TextDecoration.underline
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
