part of 'order_bloc.dart';

class OrderState extends Equatable {
  final int selectPayMethodsId;

  final ReqState? cancelOrderReqState;

  final ReqState? createOrderReqState;

  const OrderState({
    this.selectPayMethodsId = 1,
    this.createOrderReqState,
    this.cancelOrderReqState,
  });

  OrderState copyWith({
    int? selectPayMethodsId,
    ReqState? cancelOrderReqState,
    ReqState? createOrderReqState,
  }) {
    return OrderState(
      selectPayMethodsId: selectPayMethodsId ?? this.selectPayMethodsId,
      cancelOrderReqState: cancelOrderReqState ?? this.cancelOrderReqState,
      createOrderReqState: createOrderReqState ?? this.createOrderReqState,
    );
  }

  @override
  List<Object?> get props => [
        selectPayMethodsId,
        cancelOrderReqState,
        createOrderReqState,
      ];
}
