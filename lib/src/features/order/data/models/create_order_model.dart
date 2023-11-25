import 'package:equatable/equatable.dart';

class CreateOrderModel extends Equatable {
  final String token;

  final String desc;

  final String coupon_code;

  final String payment_method;

  final int user_address_id;

  const CreateOrderModel({
    required this.token,
    required this.desc,
    required this.coupon_code,
    required this.payment_method,
    required this.user_address_id,
  });

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "description": desc,
      "coupon_code": coupon_code,
      "payment_method": payment_method,
      "user_address_id": user_address_id,
    };
  }

  @override
  List<Object> get props => [
        token,
        desc,
        coupon_code,
        payment_method,
        user_address_id,
      ];
}
