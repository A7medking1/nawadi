import 'package:alnawadi/src/features/profile/controller/my_order/my_order_bloc.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_entity.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/empty_order.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/order_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelOrderWidget extends StatelessWidget {
  const CancelOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MyOrderBloc>();

     List<OrderEntity> order = bloc.state.orders
        .where((element) => element.status == 'cancelled')
        .toList();
    /*if(bloc.state.orders.isEmpty){
      order = [];
    }*/

    if (order.isEmpty) {
      return const EmptyOrder();
    }

    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: order.length,
        separatorBuilder: (context, index) => 20.verticalSpace,
        itemBuilder: (context, index) {
          return OrderItems(
            order: order[index],
          );
        },
      ),
    );
  }
}
