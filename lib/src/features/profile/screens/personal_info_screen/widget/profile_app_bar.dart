import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.05,
          decoration: const BoxDecoration(
            // color: AppColors.primary,
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: double.infinity,
            padding: EdgeInsetsDirectional.only(start: 15.h, end: 30.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => context.pop(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  AppStrings.personalInformation.tr(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.white,
                  )
                ),
                const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
