import 'dart:async';

import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/profile/data/models/chnage_password.dart';
import 'package:alnawadi/src/features/profile/data/models/contact_us_model.dart';
import 'package:alnawadi/src/features/profile/data/models/notification.dart';
import 'package:alnawadi/src/features/profile/data/models/settings_model.dart';
import 'package:alnawadi/src/features/profile/data/models/update_user_data.dart';
import 'package:alnawadi/src/features/profile/domain/entity/user_entity.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/change_user_password.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/contact_us.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/get_user_data.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/log_out_useCase.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/notification/get_notification.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/store_policy/get_about_us_page.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/store_policy/get_policy_page.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/store_policy/get_privecy_policy.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/store_policy/get_settings.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/store_policy/get_store_policy.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/store_policy/get_terms.dart';
import 'package:alnawadi/src/features/profile/domain/use_cases/update_user_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this.getUserDataUseCase,
    this.logOutUserUseCase,
    this.changeUserPasswordUseCase,
    this.updateUserDataUseCase,
    this.contactUsUseCase,
    this.getStorePolicyUseCase,
    this.getSettingsUseCase,
    this.getTermsPageUseCase,
    this.getAboutUsPageUseCase,
    this.getPolicyPageUseCase,
    this.getPrivacyPolicyUseCase,
    this.getNotificationUseCase,
  ) : super(const ProfileState()) {
    on<GetUserDataEvent>(_getUserData);
    on<LogOutEvent>(_logOut);
    on<UpdateUserDataEvent>(_updateUserData);
    on<ChangeUserPassEvent>(_changeUserPass);
    on<PostContactUsEvent>(_contactUs);
    on<GetSettingsEvent>(_getSettings);
    on<GetStorePolicyEvent>(_getStorePolicy);
    on<GetAboutUsPageEvent>(_getAboutUSPolicy);
    on<GetTermsPageEvent>(_getTermsPolicy);
    on<GetPrivacyPolicyEvent>(_getPrivacyPolicy);
    on<GetPolicyPageEvent>(_getPolicyPage);
    on<GetNotificationsEvent>(_getNotifiction);
  }

  final GetUserDataUseCase getUserDataUseCase;
  final LogOutUserUseCase logOutUserUseCase;
  final ChangeUserPasswordUseCase changeUserPasswordUseCase;
  final UpdateUserDataUseCase updateUserDataUseCase;
  final ContactUsUseCase contactUsUseCase;

  final GetStorePolicyUseCase getStorePolicyUseCase;
  final GetSettingsUseCase getSettingsUseCase;
  final GetTermsPageUseCase getTermsPageUseCase;
  final GetAboutUsPageUseCase getAboutUsPageUseCase;
  final GetPolicyPageUseCase getPolicyPageUseCase;
  final GetPrivacyPolicyUseCase getPrivacyPolicyUseCase;

  final GetNotificationUseCase getNotificationUseCase;

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController oldPass = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  FutureOr<void> _getUserData(
      GetUserDataEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(reqState: ReqState.loading));

    final result = await getUserDataUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          reqState: ReqState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          user: r,
          reqState: ReqState.success,
        ),
      ),
    );
  }

  FutureOr<void> _logOut(LogOutEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(logOutReqState: ReqState.loading));

    final result = await logOutUserUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          logOutReqState: ReqState.error,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            logOutReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _updateUserData(
      UpdateUserDataEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(updateDataState: ReqState.loading));

    final result = await updateUserDataUseCase(event.model);

    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);
        emit(
          state.copyWith(
            updateDataState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        // event.context.goNamed(Routes.home);
        showToast(msg: 'updated', state: ToastStates.SUCCESS);
        //  OverlayLoadingProgress.stop();
        emit(
          state.copyWith(
            updateDataState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _changeUserPass(
      ChangeUserPassEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(chanePassReqState: ReqState.loading));

    final result = await changeUserPasswordUseCase(event.model);

    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);

        emit(
          state.copyWith(
            chanePassReqState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        showToast(msg: 'updated', state: ToastStates.SUCCESS);
        event.context.goNamed(Routes.home);
        emit(
          state.copyWith(
            chanePassReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _contactUs(
      PostContactUsEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(contactUsReqState: ReqState.loading));

    final result = await contactUsUseCase(event.model);

    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);
        emit(
          state.copyWith(
            contactUsReqState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        showToast(msg: 'send', state: ToastStates.SUCCESS);
        event.context.goNamed(Routes.home);
        emit(
          state.copyWith(
            contactUsReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _getSettings(
      GetSettingsEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(policyReqState: ReqState.loading));

    final result = await getSettingsUseCase(const NoParameters());
    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);
        emit(
          state.copyWith(
            policyReqState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            settingsModel: r,
            policyReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _getStorePolicy(
      GetStorePolicyEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(policyReqState: ReqState.loading));

    final result = await getStorePolicyUseCase(const NoParameters());
    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);
        emit(
          state.copyWith(
            policyReqState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            text: r,
            policyReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _getAboutUSPolicy(
      GetAboutUsPageEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(policyReqState: ReqState.loading));

    final result = await getAboutUsPageUseCase(const NoParameters());
    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);
        emit(
          state.copyWith(
            policyReqState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            text: r,
            policyReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _getTermsPolicy(
      GetTermsPageEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(policyReqState: ReqState.loading));

    final result = await getTermsPageUseCase(const NoParameters());
    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);
        emit(
          state.copyWith(
            policyReqState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            text: r,
            policyReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _getPrivacyPolicy(
      GetPrivacyPolicyEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(policyReqState: ReqState.loading));

    final result = await getPrivacyPolicyUseCase(const NoParameters());
    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);
        emit(
          state.copyWith(
            policyReqState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            text: r,
            policyReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _getPolicyPage(
      GetPolicyPageEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(policyReqState: ReqState.loading));

    final result = await getPolicyPageUseCase(const NoParameters());
    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);
        emit(
          state.copyWith(
            policyReqState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            text: r,
            policyReqState: ReqState.success,
          ),
        );
      },
    );
  }

  FutureOr<void> _getNotifiction(
      GetNotificationsEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(getNotificationReqState: ReqState.loading));

    final result = await getNotificationUseCase(const NoParameters());
    result.fold(
      (l) {
        showToast(msg: l.message, state: ToastStates.ERROR);
        emit(
          state.copyWith(
            getNotificationReqState: ReqState.error,
            message: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            notificationModel: r,
            getNotificationReqState: ReqState.success,
          ),
        );
      },
    );
  }
}
