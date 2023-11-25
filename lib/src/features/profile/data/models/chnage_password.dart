import 'package:equatable/equatable.dart';

class ChangePassModel extends Equatable {
  final String old_password;
  final String new_password;
  final String new_password_confirmation;

  ChangePassModel({
    required this.old_password,
    required this.new_password,
    required this.new_password_confirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      "old_password": old_password,
      "new_password": new_password,
      "new_password_confirmation": new_password_confirmation,
    };
  }

  @override
  List<Object> get props => [
        old_password,
        new_password,
        new_password_confirmation,
      ];
}
