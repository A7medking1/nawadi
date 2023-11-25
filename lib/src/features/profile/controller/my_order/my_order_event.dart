part of 'my_order_bloc.dart';

abstract class MyOrderEvent extends Equatable {
  const MyOrderEvent();
}


class ChangeOrderStatusEvent extends MyOrderEvent {

  final OrderStatus orderStatus;

  const ChangeOrderStatusEvent(this.orderStatus);

  @override
  List<Object> get props => [orderStatus];
}


class GetUserOrderEvent extends MyOrderEvent {

  @override
  List<Object> get props => [];
}

class GetOrderDetailsEvent extends MyOrderEvent {

  final int orderId ;
  final BuildContext context;


  const GetOrderDetailsEvent(this.orderId,this.context);

  @override
  List<Object> get props => [orderId,context];
}