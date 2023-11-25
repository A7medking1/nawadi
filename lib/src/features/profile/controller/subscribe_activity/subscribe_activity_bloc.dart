import 'dart:async';

import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/features/activities/domain/entity/subscriptions_activity_entity.dart';
import 'package:alnawadi/src/features/activities/domain/use_cases/get_subscribed.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'subscribe_activity_event.dart';

part 'subscribe_activity_state.dart';

class SubscribeActivityBloc
    extends Bloc<SubscribeActivityEvent, SubscribeActivityState> {
  SubscribeActivityBloc(this.getSubscribedActivitiesUseCase)
      : super(const SubscribeActivityState()) {
    on<GetSubScribedActivityEvent>(_getSubscribed);
  }

  final GetSubscribedActivitiesUseCase getSubscribedActivitiesUseCase;

  FutureOr<void> _getSubscribed(GetSubScribedActivityEvent event,
      Emitter<SubscribeActivityState> emit) async {
    emit(state.copyWith(subReqState: ReqState.loading));

    final result = await getSubscribedActivitiesUseCase(1);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          subReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.data.isEmpty) {
          emit(
            state.copyWith(
              subReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              subscribed: r,
              subReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }
}
