import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/widget/cached_image_network.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/cart/presentation/controller/cart_bloc.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/widget/increase_reduse_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItems extends StatelessWidget {
  final CartItemsEntity cartItemsEntity;

  const CartItems({
    super.key,
    required this.cartItemsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 95.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(15),
                    child: CachedImages(
                      imageUrl: cartItemsEntity.image.toImageUrl,
                      fit: BoxFit.cover,
                      height: 120.h,
                      width: 120.w,
                    ),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(top: 15, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartItemsEntity.name,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 13.sp,
                                  ),
                        ),
                        15.verticalSpace,
                        Text(
                          '\$${cartItemsEntity.price}',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(

                                    color: AppColors.primary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CartItemUpdateWidget(cartItemsEntity: cartItemsEntity),
        ],
      ),
    );
  }
}

class CartItemUpdateWidget extends StatelessWidget {
  const CartItemUpdateWidget({
    super.key,
    required this.cartItemsEntity,
  });

  final CartItemsEntity cartItemsEntity;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartBloc>();
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                bloc.add(RemoveProductFromCartEvent(cartItemsEntity.id));
              },
              child: SvgPicture.asset(
                AppSvg.remove,
                height: 20,
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 10,
              ),
              child: Row(
                children: [
                  IncreaseReduceIcon(
                    icon: Icons.add,
                    onTap: () {
                      bloc.add(
                        AddProductToCartEvent(
                          productId: cartItemsEntity.productId,
                          isIncrease: true,
                          quantity: 1,
                        ),
                      );
                    },
                  ),
                  10.horizontalSpace,
                  Text(
                    cartItemsEntity.quantity.toString(),
                    style: TextStyle(color: AppColors.black),
                  ),
                  10.horizontalSpace,
                  IncreaseReduceIcon(
                    icon: Icons.remove,
                    onTap: () {
                      bloc.add(
                          ReduceQuantityForProductEvent(cartItemsEntity.id));
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  SizedBox loading() => SizedBox(
        height: 15.r,
        width: 15.r,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
}
