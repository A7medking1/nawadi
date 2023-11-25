import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_entity.dart';
import 'package:alnawadi/src/features/profile/controller/my_order/my_order_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItems extends StatelessWidget {
  const OrderItems({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyOrderBloc>();
    return BlocConsumer<MyOrderBloc, MyOrderState>(
      listener: (context, state) {
        if (state.orderDetailsReqState == ReqState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.orderDetailsReqState == ReqState.success) {
          OverlayLoadingProgress.stop();
        }
        if (state.orderDetailsReqState == ReqState.error) {
          OverlayLoadingProgress.stop();
        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(15.r),
            border: Border.all(color: AppColors.grey.withOpacity(0.4)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'رقم الطلب : ${order.id}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12.sp,
                          ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(9),
                    // width: 60,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: orderStatusColor(order.status),
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(15.r),
                        bottomStart: Radius.circular(15.r),
                      ),
                    ),
                    child: Text(
                      orderStatusText(order.status),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 12.sp,
                            color: orderTextStatusColor(order.status),
                          ),
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      order.orderItems.length,
                      (index) => Row(
                        children: [
                          Text(
                            '${index + 1}-',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 13.sp),
                          ),
                          7.horizontalSpace,
                          Text(
                            order.orderItems[index].orderProducts.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 13.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المبلغ الاجمالي',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 15.sp),
                        ),
                        Text(
                          '\$${order.total}',
                          style: getMediumStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    CustomButton(
                        onTap: () {
                          bloc.add(GetOrderDetailsEvent(order.id, context));
                        },
                        text: AppStrings.orderDetails.tr()),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Color orderStatusColor(String status) {
  switch (status) {
    case 'pending':
    case 'delivering':
    case 'processing':
      return AppColors.grey.withOpacity(0.2);
    case 'completed':
      return AppColors.greenWIthOp;
    case 'cancelled':
      return AppColors.redWIthOp;
  }
  return Colors.black;
}

String orderStatusText(String status) {
  switch (status) {
    case 'pending':
      return 'معلقة';
    case 'completed':
      return 'مكتملة';
    case 'cancelled':
      return 'ملغية';
    case 'processing':
      return 'قيد المعالجة';
    case 'delivering':
      return 'جاري التوصيل';
  }
  return '';
}

Color orderTextStatusColor(String status) {
  switch (status) {
    case 'pending':
    case 'delivering':
    case 'processing':
      return AppColors.grey;
    case 'completed':
      return AppColors.green;
    case 'cancelled':
      return AppColors.red;
  }
  return Colors.black;
}

