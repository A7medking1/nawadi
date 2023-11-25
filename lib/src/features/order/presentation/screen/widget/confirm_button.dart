import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/core/widget/custom_loading.dart';
import 'package:alnawadi/src/features/order/data/models/create_order_model.dart';
import 'package:alnawadi/src/features/order/presentation/controller/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmButton extends StatelessWidget {
  final String couponCode;

  const ConfirmButton({
    super.key,
    required this.couponCode,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OrderBloc>();
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state.createOrderReqState == ReqState.loading) {
          OverlayLoadingProgress.start(context);
        }
        if (state.createOrderReqState == ReqState.success) {
          OverlayLoadingProgress.stop();
          //   context.goNamed(Routes.successPayOrder);
        }
        if (state.createOrderReqState == ReqState.error) {
          OverlayLoadingProgress.stop();
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            final address = sl<AppPreferences>().getLocation();

            if (address.userId == 0) {
              showToast(
                  msg: 'Please select  address', state: ToastStates.ERROR);
              return;
            }

            if (address.phone != '') {
              CreateOrderModel model = CreateOrderModel(
                token: sl<AppPreferences>().getUserToken(),
                desc: bloc.descController.text,
                coupon_code: couponCode,
                payment_method: state.selectPayMethodsId.getPayMethods,
                user_address_id: address.id!,
              );
              bloc.add(CreateOrderEvent(model, context));
            }
          },
          text: 'تاكيد',
        );
      },
    );
  }
}

extension PayMethods on int {
  String get getPayMethods {
    print(this == 1 ? "cash_on_delivery" : "skipcash");
    return this == 1 ? "cash_on_delivery" : "skipcash";
  }
}
