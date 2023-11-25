import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/widget/vertical_shimmer.dart';
import 'package:alnawadi/src/features/profile/controller/my_order/my_order_bloc.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/empty_order.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/order_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [hande empty order] ///

class AllOrderWidget extends StatelessWidget {
  const AllOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
      builder: (context, state) {
        return switch (state.getOrderReqState) {
          ReqState.loading => const Expanded(child: BuildShimmer()),
          ReqState.empty => const EmptyOrder(),
          ReqState.error => Text(state.message),
          ReqState.success => Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.orders.length,
                separatorBuilder: (context, index) => 20.verticalSpace,
                itemBuilder: (context, index) {
                  return OrderItems(
                    order: state.orders[index],
                  );
                },
              ),
            )
        };
      },
    );
  }
}
