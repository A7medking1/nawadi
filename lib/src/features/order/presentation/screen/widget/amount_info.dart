import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AmountInformation extends StatelessWidget {
  const AmountInformation({
    super.key,
    required this.totalPurchaseAmount,
    required this.discountPrice,
    required this.totalAmount,
  });

  final String totalPurchaseAmount;
  final String discountPrice;
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppStrings.totalOrderAmount.tr(),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: 17.sp,
              ),
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.totalPurchaseAmount.tr(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.primary,
                fontSize: 13.sp
                  ),
            ),
            Text(
              totalPurchaseAmount,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.primary,
                  ),
            ),
          ],
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.discountPrice.tr(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.primary,
                  fontSize: 13.sp

              ),
            ),
            Text(
              discountPrice,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.primary,
                  ),
            ),
          ],
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.totalAmount.tr(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 17.sp,
                  ),
            ),
            Text(
              totalAmount,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.primary,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
