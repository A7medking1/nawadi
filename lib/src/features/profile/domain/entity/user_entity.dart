import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;

  final String name;

  final String email;

  final String phone;

  final int status;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
  });

  @override
  List<Object> get props => [id, name, email, phone, status];
}
/*

  {
  "id": 7,
  "name": "ziiadnasr",
  "type": "user",
  "status": 1,
  "email": "ziaadnasr@gmail.com",
  "phone": "01021549876",
  "email_verified_at": "2023-08-15T08:00:10.000000Z",
  "created_at": "2023-08-15T07:59:17.000000Z",
  "updated_at": "2023-08-15T08:00:10.000000Z"
  }
*/
