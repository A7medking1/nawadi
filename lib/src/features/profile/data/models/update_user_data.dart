import 'package:equatable/equatable.dart';

class UpdateUserDataModel extends Equatable {
  final String? name;
  final String? phone;
  final String? email;

  const UpdateUserDataModel({
    this.name,
    this.phone,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
    };
  }

  @override
  List<Object?> get props => [name, phone, email];
}
