part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserEntity user;

  final ReqState reqState;
  final ReqState? chanePassReqState;
  final ReqState? updateDataState;
  final ReqState? contactUsReqState;
  final ReqState policyReqState;
  final ReqState getNotificationReqState;
  final SettingsModel? settingsModel;
  final NotificationModel? notificationModel;

  final String message;
  final String text;

  final ReqState logOutReqState;

  const ProfileState({
    this.user =
        const UserEntity(email: '', name: '', id: 1, phone: '', status: 1),
    this.reqState = ReqState.loading,
    this.message = '',
    this.text = '',
    this.logOutReqState = ReqState.empty,
    this.updateDataState,
    this.chanePassReqState,
    this.contactUsReqState,
    this.policyReqState = ReqState.loading,
    this.settingsModel,
    this.getNotificationReqState = ReqState.loading,
    this.notificationModel,
  });

  ProfileState copyWith({
    UserEntity? user,
    ReqState? reqState,
    ReqState? logOutReqState,
    ReqState? chanePassReqState,
    ReqState? updateDataState,
    ReqState? contactUsReqState,
    ReqState? policyReqState,
    ReqState? getNotificationReqState,
    SettingsModel? settingsModel,
    NotificationModel? notificationModel,
    String? message,
    String? text,
  }) {
    return ProfileState(
      user: user ?? this.user,
      reqState: reqState ?? this.reqState,
      message: message ?? this.message,
      logOutReqState: logOutReqState ?? this.logOutReqState,
      updateDataState: updateDataState ?? this.updateDataState,
      chanePassReqState: chanePassReqState ?? this.chanePassReqState,
      getNotificationReqState:
          getNotificationReqState ?? this.getNotificationReqState,
      contactUsReqState: contactUsReqState ?? this.contactUsReqState,
      policyReqState: policyReqState ?? this.policyReqState,
      settingsModel: settingsModel ?? this.settingsModel,
      notificationModel: notificationModel ?? this.notificationModel,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [
        user,
        reqState,
        chanePassReqState,
        updateDataState,
        message,
        getNotificationReqState,
        logOutReqState,
        contactUsReqState,
        policyReqState,
        notificationModel,
        settingsModel,
        text
      ];
}
