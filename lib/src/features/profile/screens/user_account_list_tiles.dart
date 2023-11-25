import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/widget/list_tile_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.account.tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
        ),
        10.verticalSpace,
        CustomListTileWidget(
          title: AppStrings.personalInformation.tr(),
          leadingIcon: AppSvg.profile_user,
          onTap: () => context.pushNamed(Routes.personalInfo),
        ),
        10.verticalSpace,
        CustomListTileWidget(
          title: AppStrings.participatedActivities.tr(),
          leadingIcon: AppSvg.activity_sub,
          onTap: () => context.pushNamed(Routes.myActivity),
        ),
        10.verticalSpace,
        CustomListTileWidget(
          title: AppStrings.myRequests.tr(),
          leadingIcon: AppSvg.my_order,
          onTap: () => context.pushNamed(Routes.myOrder),
        ),
        10.verticalSpace,
        CustomListTileWidget(
          title: AppStrings.myAddresses.tr(),
          leadingIcon: AppSvg.my_locations,
          onTap: () => context.pushNamed(Routes.myLocations),
        ),
        20.verticalSpace,
      ],
    );
  }
}
