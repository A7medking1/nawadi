import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SuccessSubscribeScreen extends StatelessWidget {
  const SuccessSubscribeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppSvg.congrate,
                ),
                40.verticalSpace,
                Text(
                  AppStrings.congratulations.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                20.verticalSpace,
                Text(
                  AppStrings.successful_subscription_message.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.grey),
                ),
                60.verticalSpace,
                CustomButton(
                  onTap: () => context.goNamed(Routes.home),
                  text: AppStrings.return_to_homepage.tr(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
