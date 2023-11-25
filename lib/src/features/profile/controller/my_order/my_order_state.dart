part of 'my_order_bloc.dart';

enum OrderStatus { all, complete, cancel, pending }

class MyOrderState extends Equatable {
  final OrderStatus selectedStatus;

  final List<OrderEntity> orders;

  final OrderDetailsEntity? orderDetailsEntity;

  final ReqState? orderDetailsReqState;

  final ReqState getOrderReqState;
  final String message;

  const MyOrderState({
    this.selectedStatus = OrderStatus.all,
    this.message = '',
    this.orders = const [],
    this.getOrderReqState = ReqState.loading,
    this.orderDetailsEntity,
    this.orderDetailsReqState,
  });

  MyOrderState copyWith({
    OrderStatus? selectedStatus,
    List<OrderEntity>? orders,
    ReqState? getOrderReqState,
    String? message,
    OrderDetailsEntity? orderDetailsEntity,
    ReqState? orderDetailsReqState,
  }) {
    return MyOrderState(
        selectedStatus: selectedStatus ?? this.selectedStatus,
        message: message ?? this.message,
        orders: orders ?? this.orders,
        getOrderReqState: getOrderReqState ?? this.getOrderReqState,
        orderDetailsEntity: orderDetailsEntity ?? this.orderDetailsEntity,
        orderDetailsReqState:
        orderDetailsReqState ?? this.orderDetailsReqState);
  }

    @override
  List<Object?> get props =>
      [
        selectedStatus,
        orders,
        orderDetailsEntity,
        orderDetailsReqState,
        getOrderReqState,
        message,
      ];
}
