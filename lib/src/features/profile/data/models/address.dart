import 'package:alnawadi/src/features/profile/domain/entity/address.dart';

class AddressModel extends AddressEntity {
  const AddressModel({
    super.id,
    required super.country,
    required super.state,
    super.userId,
    required super.city,
    required super.address_1,
    required super.name,
    required super.email,
    required super.phone,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      country: json['country'],
      state: json['state'],
      userId: json['user_id'],
      city: json['city'],
      address_1: json['address_1'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'country': country,
      'state': state,
      'user_id': userId,
      'city': city,
      'address_1': address_1,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
