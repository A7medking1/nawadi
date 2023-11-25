import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/features/profile/controller/my_order/my_order_bloc.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/all_order_widget.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/cancel_order_widget.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/complete_order_widget.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/order_status_widget.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/pending_order_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<MyOrderBloc>()
        .add(const ChangeOrderStatusEvent(OrderStatus.all));
    context.read<MyOrderBloc>().add(GetUserOrderEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.myRequests.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: const MyOrderBody(),
    );
  }
}

class MyOrderBody extends StatelessWidget {
  const MyOrderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<MyOrderBloc>().add(GetUserOrderEvent());
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const OrderStatusItemsWidget(),
                20.verticalSpace,
                switch (state.selectedStatus) {
                  OrderStatus.all => const AllOrderWidget(),
                  OrderStatus.complete => const CompleteOrderWidget(),
                  OrderStatus.pending => const PendingOrderWidget(),
                  OrderStatus.cancel => const CancelOrderWidget(),
                }
              ],
            ),
          ),
        );
      },
    );
  }
}
