part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}


class RegisterAuthEvent extends AuthEvent {
  final RegisterModel registerEntity;

  const RegisterAuthEvent(this.registerEntity);
}

class LoginAuthEvent extends AuthEvent {
  final LoginEntity loginEntity;

  const LoginAuthEvent(this.loginEntity);
}

class VerifyEmailAuthEvent extends AuthEvent {
  final VerifyEmailParameters verifyEmailParameters;

  const VerifyEmailAuthEvent(this.verifyEmailParameters);
}

class LogOutAuthEvent extends AuthEvent {}

class ForgetPasswordAuthEvent extends AuthEvent {
  final String email;

  const ForgetPasswordAuthEvent(this.email);
}

class ResendCodeAuthEvent extends AuthEvent {
  final String email;

  const ResendCodeAuthEvent(this.email);
}

class ResetPasswordAuthEvent extends AuthEvent {
  final ResetPasswordParameters resetPasswordParameters;

  const ResetPasswordAuthEvent(this.resetPasswordParameters);
}

class VerifyCodeAuthEvent extends AuthEvent {
  final VerifyCodeParameters verifyCodeParameters;

  const VerifyCodeAuthEvent(this.verifyCodeParameters);
}

class ChangePassTextEvent extends AuthEvent {

  final bool isVisible ;

  const ChangePassTextEvent(this.isVisible);
}
