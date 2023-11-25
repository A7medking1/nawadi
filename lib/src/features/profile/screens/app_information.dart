import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/widget/list_tile_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ApplicationInformation extends StatelessWidget {
  const ApplicationInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.application.tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        10.verticalSpace,
        CustomListTileWidget(
          title: AppStrings.notifications.tr(),
          leadingIcon: AppSvg.notifi,
          onTap: () => context.pushNamed(Routes.notifications),
        ),
        10.verticalSpace,
        CustomListTileWidget(
          title: AppStrings.aboutTheApplication.tr(),
          leadingIcon: AppSvg.about_app,
          onTap: () => context.pushNamed(Routes.aboutApp),
        ),
        10.verticalSpace,
        CustomListTileWidget(
          title: AppStrings.privacyPolicy.tr(),
          leadingIcon: AppSvg.privecy,
          onTap: () => context.pushNamed(Routes.privacyPolicy),
        ),
        10.verticalSpace,
        CustomListTileWidget(
          title: AppStrings.shareTheApplication.tr(),
          leadingIcon: AppSvg.share_app,
          onTap: () {},
        ),
        10.verticalSpace,
        CustomListTileWidget(
          title: AppStrings.contactUs.tr(),
          leadingIcon: AppSvg.contact_us,
          onTap: () => context.pushNamed(Routes.contactUs),
        ),
      ],
    );
  }
}
