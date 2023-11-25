import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/alert_dialog.dart';
import 'package:alnawadi/src/core/widget/cached_image_network.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/features/cart/presentation/controller/cart_bloc.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/alert_dialog.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/discount_container.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductsItems extends StatelessWidget {
  final ProductData product;

  const ProductsItems({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      buildWhen: (prev, curr) =>
          prev.addProductToCartReqState != curr.addProductToCartReqState,
      listener: (context, state) {
        if (state.addProductToCartReqState == ReqState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.addProductToCartReqState == ReqState.success) {
          OverlayLoadingProgress.stop();
          //showToast(msg: 'Added To Cart', state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state) {
        return FittedBox(
          child: Card(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(17.r),
              borderSide: BorderSide(
                color: AppColors.grey.withOpacity(0.3),
              ),
            ),
            elevation: 0,
            child: SizedBox(
              width: 220.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        17.r,
                      ),
                      topLeft: Radius.circular(
                        17.r,
                      ),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: CachedImages(
                        height: 160.h,
                        imageUrl: ApiConstant.imagePath(
                          product.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            Text(
                              '\$${product.price}',
                              style:Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 14.sp,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        10.verticalSpace,
/*
                    Text(
                      'مشروبات غازية',
                      style: getLightStyle(color: AppColors.grey),
                    ),
*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                DiscountContainer(
                                  title: 'خصم %20',
                                  fontColor: const Color(0xFFF59A24),
                                  color: Colors.red.withOpacity(0.3),
                                ),
                                DiscountContainer(
                                  title: '4.8',
                                  fontColor: const Color(0xFFF59A24),
                                  iconData: Icons.star,
                                  color: AppColors.yellowDark.withOpacity(0.3),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                final bool isUserSkipLogin =
                                    sl<AppPreferences>().isSkipLogin();
                                if (!isUserSkipLogin) {
                                  showAlertDialog(
                                    context: context,
                                    onTapYes: () {
                                      context.pop();
                                      context.read<CartBloc>().add(
                                            AddProductToCartEvent(
                                              productId: product.id,
                                              quantity: 1,
                                            ),
                                          );
                                    },
                                    title: AppStrings
                                        .are_you_sure_you_want_to_add_it_to_the_cart
                                        .tr(),
                                    icon: AppSvg.verify,
                                  );
                                } else {
                                  showAlertForSkipSignIn(context);
                                }
                              },
                              child: const CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.primary,
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: AppColors.white,
                                  size: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
