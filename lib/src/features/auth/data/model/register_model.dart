import 'package:alnawadi/src/features/auth/domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.password,
    required super.fcm,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'fcm': fcm,
    };
  }
}
