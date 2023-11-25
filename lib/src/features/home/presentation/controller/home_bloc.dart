import 'dart:async';

import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/home/domain/entity/banners.dart';
import 'package:alnawadi/src/features/home/domain/use_cases/get_banners.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.getBannersUseCase,
  ) : super(const HomeState()) {
  //  on<GetAllProductEvent>(_getAllProducts);
    on<GetBannersEvent>(_getBanners);
  }

  final GetBannersUseCase getBannersUseCase;

  FutureOr<void> _getBanners(
      GetBannersEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(bannersReqState: ReqState.loading));

    final result = await getBannersUseCase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          bannersReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.isEmpty) {
          emit(
            state.copyWith(
              bannersReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              banners: r,
              bannersReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  /*FutureOr<void> _getAllProducts(
      GetAllProductEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(allProductReqState: ReqState.loading));

    final result = await getAllProductUseCase(1);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          allProductReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.data.isEmpty) {
          emit(
            state.copyWith(
              allProductReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              allProducts: r,
              allProductReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }*/
}
