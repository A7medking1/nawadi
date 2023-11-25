import 'package:alnawadi/src/features/order/domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.status,
    required super.payment_status,
    required super.total,
    required super.id,
    required super.orderItems,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      status: json['status'],
      payment_status: json['payment_status'],
      total: json['total'],
      id: json['id'],
      orderItems: List<OrderItemsModel>.from(
          (json['order_items']).map((e) => OrderItemsModel.fromJson(e))),
    );
  }
}

class OrderItemsModel extends OrderItemsEntity {
  const OrderItemsModel({
    required super.id,
    required super.product_id,
    required super.order_id,
    required super.orderProducts,
  });

  factory OrderItemsModel.fromJson(Map<String, dynamic> json) {
    return OrderItemsModel(
      id: json['id'],
      product_id: json['product_id'],
      order_id: json['order_id'],
      orderProducts: OrderProductModel.fromJson(json['product']),
    );
  }
}

class OrderProductModel extends OrderProductEntity {
  const OrderProductModel({
    required super.id,
    required super.name,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
