import 'package:equatable/equatable.dart';

class SubToActivityModel extends Equatable {
  final String age;

  final String name;

  final String living;

  final String phoneNumber;

  final String subscriptionAmount;

  final String activityId;

  final String typeScrip;

  final String numberIndividuals;

  const SubToActivityModel({
    required this.age,
    required this.name,
    required this.living,
    required this.phoneNumber,
    required this.subscriptionAmount,
    required this.activityId,
    required this.typeScrip,
    required this.numberIndividuals,
  });

  Map<String, dynamic> toJson() {
    return {
      "age": age,
      "name": name,
      "living": living,
      "phone_number": phoneNumber,
      "subscription_amount": subscriptionAmount,
      "activity_id": activityId,
      "type_scrip": typeScrip,
      "number_individuals": numberIndividuals,
    };
  }

  @override
  List<Object> get props => [
        age,
        name,
        living,
        phoneNumber,
        subscriptionAmount,
        activityId,
        typeScrip,
        numberIndividuals,
      ];
}
