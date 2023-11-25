import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/features/cart/presentation/controller/cart_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalAmountOfCartWidget extends StatefulWidget {
  const TotalAmountOfCartWidget({
    super.key,
  });

  @override
  State<TotalAmountOfCartWidget> createState() =>
      _TotalAmountOfCartWidgetState();
}

class _TotalAmountOfCartWidgetState extends State<TotalAmountOfCartWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //  context.read<CartContr>()
  }

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<CartBloc>().state.cartEntity!.cartPrices;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
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
                        fontSize: 13.sp,
                      ),
                ),
                Text(
                  '\$${state.cartEntity!.cartPrices.subtotal}',
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
                        fontSize: 13.sp,
                      ),
                ),
                Text(
                  '\$${state.cartCoupon.totalDiscount}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.primary,
                      ),
                ),
              ],
            ),
            17.verticalSpace,
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
                  '\$${state.cartCoupon.total != 0 ? state.cartCoupon.total : state.cartEntity!.cartPrices.total}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.primary,
                      ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
