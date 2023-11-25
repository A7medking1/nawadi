part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchProductsEvent extends SearchEvent {
/*
  final String query;

  const SearchProductsEvent(this.query);
*/

  @override
  List<Object> get props => [];
}

class SearchActivityEvent extends SearchEvent {
 /* final String query;

  const SearchActivityEvent(this.query);
*/

  @override
  List<Object> get props => [];
}
