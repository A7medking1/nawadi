import 'package:equatable/equatable.dart';

class CompaniesEntity extends Equatable {
  final int currentPage;

  final int total;

  final List<CompaniesData> data;

  const CompaniesEntity({
    required this.currentPage,
    required this.total,
    required this.data,
  });

  @override
  List<Object> get props => [currentPage, total, data];
}

class CompaniesData extends Equatable {
  final int id;

  final String image;

  final String name;

  const CompaniesData({
    required this.id,
    required this.image,
    required this.name,
  });

  @override
  List<Object> get props => [id, image, name];
}
