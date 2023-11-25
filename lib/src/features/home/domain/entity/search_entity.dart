import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final int id;

  final String image;

  final String price;

  final String name;

  const SearchEntity({
    required this.id,
    required this.image,
    required this.price,
    required this.name,
  });


  @override
  List<Object> get props => [id, image, price, name];
}
