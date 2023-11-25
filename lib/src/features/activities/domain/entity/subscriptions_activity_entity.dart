import 'package:equatable/equatable.dart';

class SubscribedActivitiesEntity extends Equatable {
  final int currentPage;

  final int total;

  final List<SubScripActivityDataEntity> data;

  const SubscribedActivitiesEntity({
    required this.currentPage,
    required this.total,
    required this.data,
  });

  @override
  List<Object> get props => [currentPage, total, data];
}

class SubScripActivityDataEntity extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;
  final int arrange;
  final String fileType;

  final int status;

  final String image;

  final String price;

  final String address;

  final String startDate;

  final String endDate;

  const SubScripActivityDataEntity({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.arrange,
    required this.status,
    required this.image,
    required this.price,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.fileType,
  });

  @override
  List<Object> get props => [
        id,
        nameAr,
        nameEn,
        arrange,
        status,
        image,
        price,
        address,
        startDate,
        endDate,
        fileType,
      ];
}
