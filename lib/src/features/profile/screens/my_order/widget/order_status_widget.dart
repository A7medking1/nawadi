import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/features/profile/controller/my_order/my_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusItemsWidget extends StatefulWidget {
  const OrderStatusItemsWidget({Key? key}) : super(key: key);

  @override
  State<OrderStatusItemsWidget> createState() => _OrderStatusItemsWidgetState();
}

class _OrderStatusItemsWidgetState extends State<OrderStatusItemsWidget> {
  OrderStatus orderStatus = OrderStatus.all;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsetsDirectional.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20.r),
            border: Border.all(
              color: AppColors.grey.withOpacity(
                0.4,
              ),
            ),
          ),
          child: Row(
            children: [
              StatusWidget(
                title: 'كل الطلبات',
                textColor: textColor(OrderStatus.all),
                opacity: textOpacity(OrderStatus.all),
                containerColor: containerColor(OrderStatus.all),
                onTap: () {
                  orderStatus = OrderStatus.all;
                  // setState(() {});
                  context
                      .read<MyOrderBloc>()
                      .add(ChangeOrderStatusEvent(orderStatus));
                },
              ),
              StatusWidget(
                title: 'مكتملة',
                textColor: textColor(OrderStatus.complete),
                containerColor: containerColor(OrderStatus.complete),
                opacity: textOpacity(OrderStatus.complete),
                onTap: () {
                  orderStatus = OrderStatus.complete;
                  // setState(() {});
                  context
                      .read<MyOrderBloc>()
                      .add(ChangeOrderStatusEvent(orderStatus));
                },
              ),
              StatusWidget(
                title: 'معلقة',
                textColor: textColor(OrderStatus.pending),
                opacity: textOpacity(OrderStatus.pending),
                containerColor: containerColor(OrderStatus.pending),
                onTap: () {
                  orderStatus = OrderStatus.pending;

                  context
                      .read<MyOrderBloc>()
                      .add(ChangeOrderStatusEvent(orderStatus));
                },
              ),
              StatusWidget(
                title: 'ملغية',
                textColor: textColor(OrderStatus.cancel),
                opacity: textOpacity(OrderStatus.cancel),
                containerColor: containerColor(OrderStatus.cancel),
                onTap: () {
                  orderStatus = OrderStatus.cancel;
                  // setState(() {});
                  context
                      .read<MyOrderBloc>()
                      .add(ChangeOrderStatusEvent(orderStatus));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Color textColor(OrderStatus status) {
    return orderStatus == status ? AppColors.white : AppColors.black;
  }

  double textOpacity(OrderStatus status) {
    return orderStatus == status ? 1 : 0.4;
  }

  Color containerColor(OrderStatus status) {
    return orderStatus == status ? AppColors.primary : AppColors.white;
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget(
      {super.key,
      required this.title,
      required this.textColor,
      required this.containerColor,
      required this.onTap,
      required this.opacity});

  final String title;
  final double opacity;

  final Color textColor;
  final Color containerColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Opacity(
        opacity: opacity,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsetsDirectional.all(5),
            decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadiusDirectional.circular(15)),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: textColor,
                    fontSize: 14.sp,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
