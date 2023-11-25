import 'package:equatable/equatable.dart';

class ActivityEntity extends Equatable {
  final int currentPage;

  final int total;

  final List<ActivityData> data;

  const ActivityEntity({
    required this.currentPage,
    required this.total,
    required this.data,
  });

  @override
  List<Object> get props => [currentPage, total, data];
}

class ActivityData extends Equatable {
  final int id;

  final String image;

  final String name;
  final String price;
  final String address;
  final String fileType;

  const ActivityData({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.address,
    required this.fileType,
  });

  @override
  List<Object> get props => [id, image, name,fileType];
}
