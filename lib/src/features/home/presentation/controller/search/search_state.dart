part of 'search_bloc.dart';

class SearchState extends Equatable {
  final ReqState productState;

  final ReqState activityState;

  final List<SearchEntity> searchActivity;
  final List<SearchEntity> searchProducts;

  final String message;

  const SearchState({
    this.productState = ReqState.empty,
    this.activityState = ReqState.empty,
    this.searchActivity = const [],
    this.searchProducts = const [],
    this.message = '',
  });

  SearchState copyWith({
    ReqState? productState,
    ReqState? activityState,
    List<SearchEntity>? searchActivity,
    List<SearchEntity>? searchProducts,
    String? message,
  }) {
    return SearchState(
      message: message ?? this.message,
      activityState: activityState ?? this.activityState,
      productState: productState ?? this.productState,
      searchActivity: searchActivity ?? this.searchActivity,
      searchProducts: searchProducts ?? this.searchProducts,
    );
  }

  @override
  List<Object> get props =>
      [productState, activityState, searchActivity, message, searchProducts];
}
