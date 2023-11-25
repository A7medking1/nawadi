part of 'subscribe_activity_bloc.dart';

abstract class SubscribeActivityEvent extends Equatable {
  const SubscribeActivityEvent();
}

class GetSubScribedActivityEvent extends SubscribeActivityEvent {
  @override
  List<Object> get props => [];
}
