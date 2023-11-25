import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/cart/presentation/controller/cart_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PurchaseConfirmationButton extends StatelessWidget {
  const PurchaseConfirmationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartBloc>().state;
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return CustomButton(
          onTap: () => context.pushNamed(
            Routes.createOrder,
            queryParameters: {
              'coupon': context.read<CartBloc>().couponController.text
            },
            extra: CartPricesEntity(
              subtotal: state.cartEntity!.cartPrices.subtotal,
              totalDiscount: state.cartCoupon.totalDiscount,
              total: state.cartCoupon.total != 0 ? state.cartCoupon.total : state.cartEntity!.cartPrices.total,
            ),
          ),
          text: AppStrings.purchaseConfirmation.tr(),
        );
      },
    );
  }
}
