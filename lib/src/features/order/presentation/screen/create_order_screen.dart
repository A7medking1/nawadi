import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/features/cart/domain/entity/cart_entity.dart';
import 'package:alnawadi/src/features/order/presentation/controller/order_bloc.dart';
import 'package:alnawadi/src/features/order/presentation/screen/widget/address.dart';
import 'package:alnawadi/src/features/order/presentation/screen/widget/amount_info.dart';
import 'package:alnawadi/src/features/order/presentation/screen/widget/choose_pay_method.dart';
import 'package:alnawadi/src/features/order/presentation/screen/widget/confirm_button.dart';
import 'package:alnawadi/src/features/order/presentation/screen/widget/notes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateOrderScreen extends StatelessWidget {
  final CartPricesEntity pricesEntity;
  final String couponCode;

  const CreateOrderScreen(
      {super.key, required this.pricesEntity, required this.couponCode});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OrderBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('اتمام الطلـــب'),
        ),
        body: _CreateOrderBody(
          pricesEntity: pricesEntity,
          couponCode: couponCode,
        ),
      ),
    );
  }
}

class _CreateOrderBody extends StatelessWidget {
  final CartPricesEntity pricesEntity;
  final String couponCode;

  const _CreateOrderBody(
      {Key? key, required this.pricesEntity, required this.couponCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 15,
          end: 15,
          top: 15,
          bottom: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddressSectionWidget(),
            30.verticalSpace,
            const ChoosePayMethodsWidget(),
            20.verticalSpace,
            const NotesWidget(),
            20.verticalSpace,
            AmountInformation(
              totalPurchaseAmount: '\$${pricesEntity.subtotal}',
              discountPrice: '\$${pricesEntity.totalDiscount}',
              totalAmount: '\$${pricesEntity.total}',
            ),
            30.verticalSpace,
            ConfirmButton(
              couponCode: couponCode,
            ),
          ],
        ),
      ),
    );
  }
}
