import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String status;
  final String payment_status;
  final int total;
  final int id;
  final List<OrderItemsEntity> orderItems;

  const OrderEntity({
    required this.status,
    required this.payment_status,
    required this.total,
    required this.id,
    required this.orderItems,
  });

  @override
  List<Object> get props => [
        status,
        payment_status,
        total,
        id,
        orderItems,
      ];
}

class OrderItemsEntity extends Equatable {
  final int id;
  final int product_id;
  final int order_id;
  final OrderProductEntity orderProducts;

  const OrderItemsEntity({
    required this.id,
    required this.product_id,
    required this.order_id,
    required this.orderProducts,
  });

  @override
  List<Object> get props => [id, product_id, order_id, orderProducts];
}

class OrderProductEntity extends Equatable {
  final int id;

  final String name;

  const OrderProductEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
