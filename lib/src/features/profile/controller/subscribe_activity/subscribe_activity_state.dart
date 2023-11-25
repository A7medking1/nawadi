part of 'subscribe_activity_bloc.dart';

class SubscribeActivityState extends Equatable {
  final String message;

  final SubscribedActivitiesEntity? subscribed;

  final ReqState subReqState;

  const SubscribeActivityState({
    this.message = '',
    this.subscribed,
    this.subReqState = ReqState.loading,
  });

  SubscribeActivityState copyWith({
     String? message,

     SubscribedActivitiesEntity? subscribed,

     ReqState? subReqState,
}){
    return SubscribeActivityState(
      subReqState: subReqState ?? this.subReqState,
      subscribed: subscribed ?? this.subscribed ,
      message: message ?? this.message ,
    );
  }





  @override
  List<Object?> get props => [message, subscribed, subReqState];
}
