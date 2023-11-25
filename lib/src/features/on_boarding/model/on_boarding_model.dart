import 'package:equatable/equatable.dart';

class OnBoardingModel extends Equatable {
  final String title;

  final String body;

  final String image;

  const OnBoardingModel({
    required this.title,
    required this.body,
    required this.image,
  });

  @override
  List<Object> get props => [title, body, image];
}
