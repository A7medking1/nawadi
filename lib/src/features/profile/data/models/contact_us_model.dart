import 'package:equatable/equatable.dart';

class ContactUsModel extends Equatable {
  final String phone;

  final String message;
  final String subject;
  final String name;

  const ContactUsModel({
    required this.phone,
    required this.message,
    required this.subject,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "message": message,
      "subject": subject,
      "name": name,
    };
  }

  @override
  List<Object> get props => [phone, message, subject, name];
}
