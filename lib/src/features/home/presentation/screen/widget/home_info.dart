import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeInfoWidget extends StatelessWidget {
  const HomeInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.good_morning.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 18.sp),
            ),
            Text(
              AppStrings.welcome_dear_user.tr(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    color: AppColors.grey,
                  ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            context.pushNamed(Routes.notifications);
          },
          child: SvgPicture.asset(
            AppSvg.notification,
            height: 30.h,
          ),
        ),
      ],
    );
  }
}
