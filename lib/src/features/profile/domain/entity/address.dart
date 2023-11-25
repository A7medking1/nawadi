// "id": 4,
// "created_at": "2023-08-21T15:53:22.000000Z",
// "updated_at": "2023-08-21T15:53:22.000000Z",
// "country": "مصر",
// "state": "المعادي",
// "user_id": 1,
// "city": "القاهره",
// "zip": null,
// "address_1": "شارع نور الدين",
// "address_2": null,
// "name": "طه خالد",
// "email": "tth@gmail.com",
// "phone": "01288964270",
// "delivery_instruction": null,
// "default": 2

import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final int? id;

  final String country;

  final String state;

  final int? userId;
  final String city;

  final String address_1;

  final String name;

  final String email;

  final String phone;

  const AddressEntity({
     this.id,
    required this.country,
    required this.state,
     this.userId,
    required this.city,
    required this.address_1,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        id,
        country,
        state,
        userId,
        city,
        address_1,
        name,
        email,
        phone,
      ];
}
