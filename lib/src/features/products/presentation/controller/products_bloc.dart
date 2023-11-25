import 'dart:async';

import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_category_entity.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_entity.dart';
import 'package:alnawadi/src/features/products/domain/use_cases/get_activity_categories.dart';
import 'package:alnawadi/src/features/products/domain/use_cases/get_all_product.dart';
import 'package:alnawadi/src/features/products/domain/use_cases/get_product_by_category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductBloc(
    this.getAllProductUseCase,
    this.getProductCategoryUseCase,
    this.getProductByCategoryUseCase,
  ) : super(const ProductsState()) {
    on<GetProductByCatEvent>(_getProductByCategory);
    on<UpdateCatProductSelectedEvent>(_updateCatSelected);
    on<GetAllProductEvent>(_getAllProduct);
    on<GetProductCategoriesEvent>(_getProductCategories);
    on<GetMoreProductEvent>(_getMoreProductEvent);
  }

  int page = 1;
  bool isPaginated = false;
  bool hasReachedMax = false;

  final GetAllProductUseCase getAllProductUseCase;

  final GetProductCategoryUseCase getProductCategoryUseCase;

  final GetProductByCategoryUseCase getProductByCategoryUseCase;

  FutureOr<void> _updateCatSelected(
      UpdateCatProductSelectedEvent event, Emitter<ProductsState> emit) {
    emit(
      state.copyWith(
        selectedCategory:
            SelectedProductCategory(catId: event.id, catName: event.name),
      ),
    );
  }

  FutureOr<void> _getProductByCategory(
      GetProductByCatEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(productByCategoryReqState: ReqState.loading));

    final result = await getProductByCategoryUseCase(
        GetProductByCategoryParameters(1, event.catId));

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          productByCategoryReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.data.isEmpty) {
          emit(
            state.copyWith(
              productByCategoryReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              productByCategory: r,
              productByCategoryReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _getAllProduct(
      GetAllProductEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(productByCategoryReqState: ReqState.loading));

    final result = await getAllProductUseCase(1);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          productByCategoryReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.data.isEmpty) {
          emit(
            state.copyWith(
              productByCategoryReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              productByCategory: r,
              allProducts: r,
              paginatedData: r.data,
              productByCategoryReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _getProductCategories(
      GetProductCategoriesEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(productCategoriesReqState: ReqState.loading));

    final result = await getProductCategoryUseCase(1);

    result.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          productCategoriesReqState: ReqState.error,
        ),
      ),
      (r) {
        if (r.data.isEmpty) {
          emit(
            state.copyWith(
              productCategoriesReqState: ReqState.empty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              productCategory: r,
              productCategoriesReqState: ReqState.success,
            ),
          );
        }
      },
    );
  }

  FutureOr<void> _getMoreProductEvent(
      GetMoreProductEvent event, Emitter<ProductsState> emit) async {
    if (hasReachedMax) {
      return;
    }
    isPaginated = true;

    final result = await getAllProductUseCase(++page);

    result.fold(
      (l) => showToast(msg: 'No More Data', state: ToastStates.WARNING),
      (r) {
        if (r.data.isEmpty || r.data.length < 10) {
          hasReachedMax = true;
          emit(state.copyWith(message: 'No More Data'));
        }
        isPaginated = false;
        emit(
          state.copyWith(
            paginatedData: [...state.paginatedData, ...r.data],
          ),
        );
      },
    );
  }
}
