part of 'activity_bloc.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

class GetAllActivityEvent extends ActivityEvent {
  const GetAllActivityEvent();
}

class GetCompaniesEvent extends ActivityEvent {}

class GetActivityByCompanyEvent extends ActivityEvent {
  final int catId;

  const GetActivityByCompanyEvent(this.catId);

  @override
  List<Object> get props => [catId];
}

class UpdateCatSelectedEvent extends ActivityEvent {
  final int id;
  final String name;

  const UpdateCatSelectedEvent({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}

class SubToActivityEvent extends ActivityEvent {
  final SubToActivityModel model;
  final BuildContext context ;

  const SubToActivityEvent({required this.model,required this.context});

  @override
  List<Object> get props => [model];
}



class GetMoreActivityEvent extends ActivityEvent {
  const GetMoreActivityEvent();
}