part of 'home_bloc.dart';

class HomeState extends Equatable {
  final String message;


  final List<BannersEntity> banners;

  final ReqState bannersReqState;

  const HomeState({
    this.bannersReqState = ReqState.loading,
    this.message = '',
    this.banners = const [],
  });

  HomeState copyWith({
    String? message,
    List<BannersEntity>? banners,
    ReqState? bannersReqState,
  }) {
    return HomeState(
      message: message ?? this.message,
      banners: banners ?? this.banners,
      bannersReqState: bannersReqState ?? this.bannersReqState,
    );
  }

  @override
  List<Object?> get props => [
        message,
        banners,
        bannersReqState,
      ];
}
