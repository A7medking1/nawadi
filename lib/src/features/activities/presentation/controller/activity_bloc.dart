import 'dart:async';

import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/features/activities/data/model/post_sub_activity_model.dart';
import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/activities/domain/entity/company_entity.dart';
import 'package:alnawadi/src/features/activities/domain/use_cases/get_activity_by_category.dart';
import 'package:alnawadi/src/features/activities/domain/use_cases/get_activity_categories.dart';
import 'package:alnawadi/src/features/activities/domain/use_cases/get_all_activity.dart';
import 'package:alnawadi/src/features/activities/domain/use_cases/sub_to_activity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/routes_manager.dart';

part 'activity_event.dart';

part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc(
    this.getActivityByCategoryUseCase,
    this.getAllActivityUseCase,
    this.activityCategoryUseCase,
    this.subToActivityUseCase,
  ) : super(const ActivityState()) {
    on<GetActivityByCompanyEvent>(_getActivityByCategory);
    on<UpdateCatSelectedEvent>(_updateCatSelected);
    on<GetAllActivityEvent>(_getAllActivities);
    on<GetCompaniesEvent>(_getActivityCategories);
    on<SubToActivityEvent>(_subToActivityModel);
    on<GetMoreActivityEvent>(_getMoreActivityEvent);
  }

  final GetActivityByCategoryUseCase getActivityByCategoryUseCase;

  final GetAllActivityUseCase getAllActivityUseCase;

  final GetActivityCategoryUseCase activityCategoryUseCase;

  final SubToActivityUseCase subToActivityUseCase;

  int page = 1;
  bool isPaginated = false;
  bool hasReachedMax = false;

  /// TODO >>
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController living = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController subscriptionAmount = TextEditingController();
  final TextEditingController activityId = TextEditingController();
   String typeScrip = 'month';
  final TextEditingController numberIndividuals = TextEditingController();


  void reset (){
     name.dispose();
     age.dispose();
     living.dispose();
     phoneNumber.dispose();
     subscriptionAmount.dispose();
     activityId.dispose();
     typeScrip = '';
     numberIndividuals.dispose();
  }

  /// TODO <<

  FutureOr<void> _updateCatSelected(
      UpdateCatSelectedEvent event, Emitter<ActivityState> emit) {
    emit(
      state.copyWith(
        selectedCategory:
            SelectedCategory(catId: event.id, catName: event.name),
      ),
    );
  }

  FutureOr<void> _getActivityByCategory(
    GetActivityByCompanyEvent event,
    Emitter<ActivityState> emit,
  ) async {
    emit(state.copyWith(activitiesByCompanyReqState: ReqState.loading));

    final result = await getActivityByCategoryUseCase(
        GetActivityByCategoryParameters(1, event.catId));

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          activitiesByCompanyReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.data.isEmpty) {
          emit(
            state.copyWith(
              activitiesByCompanyReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              activitiesByCompany: r,
              activitiesByCompanyReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _getAllActivities(
      GetAllActivityEvent event, Emitter<ActivityState> emit) async {
    emit(state.copyWith(
      activitiesByCompanyReqState: ReqState.loading,
    ));

    final result = await getAllActivityUseCase(1);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          activitiesByCompanyReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.data.isEmpty) {
          emit(
            state.copyWith(
              activitiesByCompanyReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              activitiesByCompany: r,
              allActivities: r,
              paginatedData: r.data,
              activitiesByCompanyReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _getActivityCategories(
      GetCompaniesEvent event, Emitter<ActivityState> emit) async {
    emit(state.copyWith(companyReqState: ReqState.loading));

    final result = await activityCategoryUseCase(1);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          companyReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.data.isEmpty) {
          emit(
            state.copyWith(
              companyReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              company: r,
              companyReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _subToActivityModel(
      SubToActivityEvent event, Emitter<ActivityState> emit) async {
    emit(state.copyWith(subToActivityState: ReqState.loading));

    final result = await subToActivityUseCase(event.model);

    result.fold(
      (l) {
        emit(
        state.copyWith(
          message: l.message,
          subToActivityState: ReqState.error,
        ),
      );
        showToast(msg: l.message, state: ToastStates.ERROR);
      },
      (r) {
        emit(
          state.copyWith(
            subToActivityState: ReqState.success,
          ),
        );
        event.context.goNamed(Routes.successSubscribeScreen);
      },
    );
  }

  FutureOr<void> _getMoreActivityEvent(
      GetMoreActivityEvent event, Emitter<ActivityState> emit) async {
    if (hasReachedMax) {
      return;
    }
    isPaginated = true;

    final result = await getAllActivityUseCase(++page);

    result.fold(
      (l) => showToast(msg: 'No More Data', state: ToastStates.WARNING),
      (r) {
        if (r.data.isEmpty || r.data.length < 10) {
          //showToast(msg: 'No More Data', state: ToastStates.WARNING);
          hasReachedMax = true;
          emit(state.copyWith(message: 'No More Data'));
        }
        isPaginated = false;
        emit(
          state.copyWith(
            paginatedData: [...state.paginatedData, ...r.data],
          ),
        );
      },
    );
  }
}
