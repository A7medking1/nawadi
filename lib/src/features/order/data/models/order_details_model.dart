import 'package:alnawadi/src/features/profile/data/models/address.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_details_entity.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  const OrderDetailsModel({
    required super.status,
    required super.payment_status,
    required super.payment_method,
    required super.description,
    required super.total,
    required super.subtotal,
    required super.discount,
    required super.id,
    required super.addressEntity,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      payment_status: json['payment_status'],
      payment_method: json['payment_method'],
      description: json['description'] ??'',
      total: json['total'],
      subtotal: json['subtotal'],
      addressEntity: AddressModel.fromJson(json['user_address']),
      status: json['status'],
      discount: json['discount'],
    );
  }
}
