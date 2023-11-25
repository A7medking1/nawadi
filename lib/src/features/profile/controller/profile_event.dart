part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetUserDataEvent extends ProfileEvent {}

class LogOutEvent extends ProfileEvent {}

class UpdateUserDataEvent extends ProfileEvent {
  final UpdateUserDataModel model;
  final BuildContext context;

  const UpdateUserDataEvent(this.model, this.context);
}

class ChangeUserPassEvent extends ProfileEvent {
  final ChangePassModel model;
  final BuildContext context;

  const ChangeUserPassEvent(this.model, this.context);
}

class PostContactUsEvent extends ProfileEvent {
  final ContactUsModel model;
  final BuildContext context;

  const PostContactUsEvent(this.model, this.context);
}

class GetStorePolicyEvent extends ProfileEvent {}

class GetPolicyPageEvent extends ProfileEvent {}

class GetPrivacyPolicyEvent extends ProfileEvent {}

class GetAboutUsPageEvent extends ProfileEvent {}

class GetTermsPageEvent extends ProfileEvent {}

class GetSettingsEvent extends ProfileEvent {}

class GetNotificationsEvent extends ProfileEvent {}

class MarkAllNotificationAsRead extends ProfileEvent {}

class GetNotificationUnreadCount extends ProfileEvent {}
