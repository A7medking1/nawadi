import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpInfoWidget extends StatelessWidget {
  const SignUpInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.create_new_account.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 21.sp),
            textAlign: TextAlign.end,
          ),
          4.verticalSpace,
          Text(
            AppStrings.please_log_in_from_here.tr(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.grey,
              fontWeight: FontWeight.w300
                ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
