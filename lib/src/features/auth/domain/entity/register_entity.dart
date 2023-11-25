import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String fcm;

  const RegisterEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.fcm ,
  });

  @override
  List<Object> get props => [name, email, phone, password,fcm];
}
