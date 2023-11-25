import 'dart:async';

import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/features/order/data/models/create_order_model.dart';
import 'package:alnawadi/src/features/order/domain/use_cases/cancel_order.dart';
import 'package:alnawadi/src/features/order/domain/use_cases/create_order.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this.cancelOrderUseCase, this.createOrderUseCase)
      : super(const OrderState()) {
    on<SelectPayMethodEvent>((event, emit) {
      emit(state.copyWith(selectPayMethodsId: event.id));
    });
    on<CancelOrderEvent>(_cancelOrder);
    on<CreateOrderEvent>(_createOrder);
  }

  final CancelOrderUseCase cancelOrderUseCase;

  final CreateOrderUseCase createOrderUseCase;

  final TextEditingController descController = TextEditingController();

  FutureOr<void> _cancelOrder(
      CancelOrderEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(cancelOrderReqState: ReqState.loading));

    final result = await cancelOrderUseCase(event.orderId);

    result.fold(
      (l) => emit(
        state.copyWith(
          cancelOrderReqState: ReqState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          cancelOrderReqState: ReqState.success,
        ),
      ),
    );
  }

  FutureOr<void> _createOrder(
      CreateOrderEvent event, Emitter<OrderState> emit) async {
    emit(state.copyWith(createOrderReqState: ReqState.loading));

    final result = await createOrderUseCase(event.orderModel);

    result.fold(
      (l) {
        emit(
          state.copyWith(
            createOrderReqState: ReqState.error,
          ),
        );
        event.context.pushNamed(Routes.pay, extra: l.message);
      },
      (r) {
        emit(
          state.copyWith(
            createOrderReqState: ReqState.success,
          ),
        );
        event.context.pushNamed(Routes.successPayOrder);
        showToast(msg: 'OrderCreate', state: ToastStates.SUCCESS);
      },
    );
  }
}
