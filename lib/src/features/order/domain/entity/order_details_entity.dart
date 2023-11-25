import 'package:alnawadi/src/features/profile/domain/entity/address.dart';
import 'package:equatable/equatable.dart';

class OrderDetailsEntity extends Equatable {
  final String status;
  final String payment_status;
  final String payment_method;
  final String description;
  final int total;
  final int subtotal;
  final int discount;
  final int id;
  final AddressEntity addressEntity;

  const OrderDetailsEntity({
    required this.status,
    required this.payment_status,
    required this.payment_method,
    required this.description,
    required this.total,
    required this.subtotal,
    required this.discount,
    required this.id,
    required this.addressEntity,
  });

  @override
  List<Object> get props => [
        status,
        payment_status,
        payment_method,
        description,
        total,
        subtotal,
        discount,
        id,
        addressEntity,
      ];
}
