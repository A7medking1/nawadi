import 'dart:async';

import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_details_entity.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_entity.dart';
import 'package:alnawadi/src/features/order/domain/use_cases/get_order_by_id.dart';
import 'package:alnawadi/src/features/order/domain/use_cases/get_user_order.dart';
import 'package:alnawadi/src/features/profile/screens/my_order/widget/order_status_stepper_bottom_sheet.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'my_order_event.dart';

part 'my_order_state.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc(this.getUserOrderUseCase, this.getOrderByIdUseCase)
      : super(const MyOrderState()) {
    on<ChangeOrderStatusEvent>((event, emit) {
      emit(state.copyWith(selectedStatus: event.orderStatus));
    });
    on<GetUserOrderEvent>(_getUserOrder);
    on<GetOrderDetailsEvent>(_getOrderDetails);
  }

  final GetUserOrderUseCase getUserOrderUseCase;
  final GetOrderByIdUseCase getOrderByIdUseCase;

  FutureOr<void> _getUserOrder(
      GetUserOrderEvent event, Emitter<MyOrderState> emit) async {
    emit(state.copyWith(getOrderReqState: ReqState.loading));

    final result = await getUserOrderUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          getOrderReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.isEmpty) {
          emit(
            state.copyWith(
              orders: const [],
              getOrderReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              orders: r,
              getOrderReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _getOrderDetails(
      GetOrderDetailsEvent event, Emitter<MyOrderState> emit) async {
    emit(state.copyWith(orderDetailsReqState: ReqState.loading));

    final result = await getOrderByIdUseCase(event.orderId);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          orderDetailsReqState: ReqState.error,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            orderDetailsEntity: r,
            orderDetailsReqState: ReqState.success,
          ),
        );
        buildShowModalBottomSheet(event.context);
      },
    );
  }
}
