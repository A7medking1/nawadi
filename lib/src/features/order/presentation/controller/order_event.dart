part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class SelectPayMethodEvent extends OrderEvent {
  final int id;

  const SelectPayMethodEvent(this.id);

  @override
  List<Object> get props => [];
}

class CreateOrderEvent extends OrderEvent {
  final CreateOrderModel orderModel;
  final BuildContext context ;

  const CreateOrderEvent(this.orderModel,this.context);

  @override
  List<Object> get props => [orderModel];
}

class CancelOrderEvent extends OrderEvent {
  final int orderId;

  const CancelOrderEvent(this.orderId);

  @override
  List<Object> get props => [orderId];
}
