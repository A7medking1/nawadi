import 'dart:async';

import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/auth/data/model/register_model.dart';
import 'package:alnawadi/src/features/auth/domain/entity/login_entity.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/forget_password_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/logOut_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/login_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/register_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/resend_code_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/reset_password_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_code_useCase.dart';
import 'package:alnawadi/src/features/auth/domain/use_cases/verify_email_useCase.dart';
import 'package:alnawadi/src/features/auth/presentation/screens/sign_up/widget/form_field_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.registerUseCase,
    this.loginUseCase,
    this.verifyEmailUseCase,
    this.logOutUseCase,
    this.forgetPasswordUseCase,
    this.resendCodeUseCase,
    this.resetPasswordUseCase,
    this.verifyCodeUseCase,
  ) : super(const AuthState()) {
    on<RegisterAuthEvent>(_register);
    on<LoginAuthEvent>(_login);
    on<VerifyEmailAuthEvent>(_verifyEmailAuth);
    on<LogOutAuthEvent>(_logOut);
    on<ForgetPasswordAuthEvent>(_forgetPassword);
    on<ResendCodeAuthEvent>(_resendCode);
    on<ResetPasswordAuthEvent>(_resetPassword);
    on<VerifyCodeAuthEvent>(_verifyCode);
    on<ChangePassTextEvent>(_changeVisiblty);
  }

  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final VerifyEmailUseCase verifyEmailUseCase;
  final LogOutUseCase logOutUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ResendCodeUseCase resendCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();

  final TextEditingController otp = TextEditingController();

  FutureOr<void> _register(
      RegisterAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(registerReqState: AuthRequestState.loading));

    final result = await registerUseCase(event.registerEntity);

    result.fold(
      (l) => emit(
        state.copyWith(
          registerReqState: AuthRequestState.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          token: r,
          registerReqState: AuthRequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _login(LoginAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginReqState: AuthRequestState.loading));

    final result = await loginUseCase(event.loginEntity);

    result.fold(
      (l) => emit(
        state.copyWith(
          loginReqState: AuthRequestState.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          token: r,
          loginReqState: AuthRequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _verifyEmailAuth(
      VerifyEmailAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(verifyEmailReqState: AuthRequestState.loading));

    final result = await verifyEmailUseCase(event.verifyEmailParameters);

    result.fold(
      (l) => emit(
        state.copyWith(
          verifyEmailReqState: AuthRequestState.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          verifyEmailReqState: AuthRequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _logOut(LogOutAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(logOutReqState: AuthRequestState.loading));

    final result = await logOutUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          logOutReqState: AuthRequestState.error,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            logOutReqState: AuthRequestState.success,
          ),
        );
        reset();
      },
    );
  }

  FutureOr<void> _forgetPassword(
      ForgetPasswordAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(forgetPasswordReqState: AuthRequestState.loading));

    final result = await forgetPasswordUseCase(event.email);

    result.fold(
      (l) => emit(
        state.copyWith(
          forgetPasswordReqState: AuthRequestState.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          forgetPasswordReqState: AuthRequestState.success,
        ),
      ),
    );
  }

  FutureOr<void> _resendCode(
      ResendCodeAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(resendCodeReqState: AuthRequestState.loading));

    final result = await resendCodeUseCase(event.email);

    result.fold(
      (l) => emit(
        state.copyWith(
          resendCodeReqState: AuthRequestState.error,
          message: l.message,
        ),
      ),
      (r) {
        emit(
          state.copyWith(
            resendCodeReqState: AuthRequestState.success,
          ),
        );
        showToast(msg: 'code sent to email', state: ToastStates.SUCCESS);
      },
    );
  }

  FutureOr<void> _verifyCode(
      VerifyCodeAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(verifyCodeReqState: AuthRequestState.loading));

    final result = await verifyCodeUseCase(event.verifyCodeParameters);

    result.fold(
      (l) => emit(
        state.copyWith(
          verifyCodeReqState: AuthRequestState.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          verifyCodeReqState: AuthRequestState.success,
          token: r,
        ),
      ),
    );
  }

  FutureOr<void> _resetPassword(
      ResetPasswordAuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(resetPasswordReqState: AuthRequestState.loading));

    final result = await resetPasswordUseCase(event.resetPasswordParameters);

    result.fold(
      (l) => emit(
        state.copyWith(
          resetPasswordReqState: AuthRequestState.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          resetPasswordReqState: AuthRequestState.success,
        ),
      ),
    );
  }

  void reset() {
    email.clear();
    password.clear();
    confirmPassword.clear();
    userName.clear();
    phone.clear();
  }

  FutureOr<void> _changeVisiblty(
      ChangePassTextEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isVisible: !event.isVisible));
  }
}
