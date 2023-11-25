import 'dart:async';

import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/features/home/domain/entity/search_entity.dart';
import 'package:alnawadi/src/features/home/domain/use_cases/search_activity.dart';
import 'package:alnawadi/src/features/home/domain/use_cases/search_product.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchActivityUseCase, this.searchProductUseCase)
      : super(const SearchState()) {
    on<SearchActivityEvent>(_searchActivity);
    on<SearchProductsEvent>(_searchProduct);
  }

  final SearchActivityUseCase searchActivityUseCase;
  final SearchProductUseCase searchProductUseCase;

  final TextEditingController query = TextEditingController();

  FutureOr<void> _searchActivity(
      SearchActivityEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(activityState: ReqState.loading));

    final result = await searchActivityUseCase(query.text);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          activityState: ReqState.error,
        ),
      ),
      (r) {
        if (r.isEmpty) {
          emit(
            state.copyWith(
              activityState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              searchActivity: r,
              activityState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _searchProduct(
      SearchProductsEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(productState: ReqState.loading));

    final result = await searchProductUseCase(query.text);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          productState: ReqState.error,
        ),
      ),
      (r) {
        if (r.isEmpty) {
          emit(
            state.copyWith(
              productState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              searchProducts: r,
              productState: ReqState.success,
            ),
          );
        }
      },
    );
  }
}
