import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtpInfoWidget extends StatelessWidget {
  const OtpInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppSvg.verify,
        ),
        20.verticalSpace,
        Text(
          AppStrings.activation_code.tr(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 22.sp,
          ),
        ),
        10.verticalSpace,
        Text(
          AppStrings.the_account_activation_code.tr(),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: AppColors.grey ,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
