import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/resources/app_assets.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/features/cart/presentation/controller/cart_bloc.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/widget/add_coupons_widget.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/widget/app_bar.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/widget/cart_item_builder.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/widget/confirm_button.dart';
import 'package:alnawadi/src/features/cart/presentation/screen/widget/total_amount_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(const GetCartItemsEvent());
  }

  /*@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
    context.read<CartBloc>().add(const RemoveCouponEvent());

  }*/

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    context.read<CartBloc>().add(const RemoveCouponEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarCartScreen(context),
      body: const _CartBody(),
    );
  }
}

class _CartBody extends StatelessWidget {
  const _CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (prev, curr) =>
          prev.getCartItemsReqState != curr.getCartItemsReqState,
      builder: (context, state) {
        if (state.getCartItemsReqState == ReqState.loading) {
          return const CartShimmer();
        }
        if (state.getCartItemsReqState == ReqState.empty) {
          return const EmptyCartWidget();
        }
        if (state.getCartItemsReqState == ReqState.error) {
          return ConnectionErrorWidget(
            onTap: () {
              context.read<CartBloc>().add(const GetCartItemsEvent());
            },
          );
        }
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 10,
            end: 10,
            top: 10,
            bottom: 50,
          ),
          child: FadeAnimation(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const CartItemsBuilder(),
                10.verticalSpace,
                const AddCouponsWidget(),
                45.verticalSpace,
                const TotalAmountOfCartWidget(),
                20.verticalSpace,
                const PurchaseConfirmationButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CartShimmer extends StatelessWidget {
  const CartShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => 20.verticalSpace,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.3),
          highlightColor: Colors.white.withOpacity(0.25),
          child: Container(
            height: 80,
            width: 120,
            color: Colors.grey.shade200,
          ),
        );
      },
    );
  }
}

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppSvg.cart_empty,
            height: 100,
            width: 100,
          ),
          30.verticalSpace,
          Text(
            AppStrings.theShoppingCartIsEmpty.tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 22.sp,
                ),
          ),
          10.verticalSpace,
          Text(
            AppStrings.viewAvailableProducts.tr(),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 13.sp,
                ),
          ),
        ],
      ),
    );
  }
}

class ConnectionErrorWidget extends StatelessWidget {
  final void Function() onTap;

  const ConnectionErrorWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppSvg.internet),
            30.verticalSpace,
            Text(
              AppStrings.connectToInternet.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.grey),
            ),
            40.verticalSpace,
            CustomButton(
              onTap: onTap,
              text: AppStrings.tryAgain.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

/// TODO DioExceptionType.unknown
