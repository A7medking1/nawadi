import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/features/cart/presentation/controller/cart_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCouponsWidget extends StatelessWidget {
  const AddCouponsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartBloc>();
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return DottedBorder(
          color: AppColors.primary,
          strokeWidth: 1.5,
          dashPattern: const [7, 7],
          borderType: BorderType.RRect,
          radius: const Radius.circular(15),
          child: CouponFormField(
            controller: bloc.couponController,
            prefixIcon: IconButton(
              icon: bloc.couponController.text == ''
                  ? const Icon(Icons.discount)
                  : const Icon(Icons.cancel),
              onPressed: () {
                context.read<CartBloc>().add(const RemoveCouponEvent());
              },
              color: AppColors.primary,
            ),
            widget: state.applyCouponReqState == ReqState.loading
                ? const LoadingApplyCouponWidget()
                : ApplyCouponButton(
                    onTap: () {
                      if (bloc.couponController.text != '') {
                        bloc.add(ApplyCouponEvent(bloc.couponController.text));
                      }
                    },
                  ),
          ),
        );
      },
    );
  }
}

class CouponFormField extends StatelessWidget {
  const CouponFormField({
    super.key,
    this.controller,
    this.widget,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final Widget? widget;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (s) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: controller,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          prefixIcon: prefixIcon,
          suffixIcon: widget,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(0),
          ),
          hintText: "ادخل كود الخصم",
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 12.sp,
                color: AppColors.grey.withOpacity(0.9),
              )),
    );
  }
}

class LoadingApplyCouponWidget extends StatelessWidget {
  const LoadingApplyCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 10.r,
        width: 15.r,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class ApplyCouponButton extends StatelessWidget {
  const ApplyCouponButton({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 70.w,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadiusDirectional.circular(25.r),
          ),
          child: Text(
            'تطبيق',
            style: TextStyle(color: AppColors.white, fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
