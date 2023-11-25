import 'package:equatable/equatable.dart';

class BannersEntity extends Equatable {
  final String name;
  final String image;
  final int arrange;
  final int status;
  final int id;

  const BannersEntity({
    required this.name,
    required this.image,
    required this.arrange,
    required this.status,
    required this.id,
  });

  @override
  List<Object> get props => [name, image, arrange, status, id];
}
