part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final String message;

  final ProductEntity? productByCategory;
  final ReqState productByCategoryReqState;
  final ReqState allProductReqState;
  final SelectedProductCategory? selectedCategory;
  final ProductCategoryEntity? productCategory;
  final ProductEntity? allProducts;
  final ReqState productCategoriesReqState;

  final List<ProductData> paginatedData;


  const ProductsState({
    this.message = '',
    this.productByCategory,
    this.productByCategoryReqState = ReqState.loading,
    this.allProductReqState = ReqState.loading,
    this.selectedCategory,
    this.productCategory,
    this.allProducts,
    this.productCategoriesReqState = ReqState.loading,
    this.paginatedData = const [] ,
  });

  ProductsState copyWith({
    String? message,
    ProductEntity? productByCategory,
    ReqState? productByCategoryReqState,
    ReqState? allProductReqState,
    SelectedProductCategory? selectedCategory,
    ProductCategoryEntity? productCategory,
    ProductEntity? allProducts,
    ReqState? productCategoriesReqState,
    List<ProductData>? paginatedData,
  }) {
    return ProductsState(
      message: message ?? this.message,
      productByCategory: productByCategory ?? this.productByCategory,
      productByCategoryReqState:
      productByCategoryReqState ?? this.productByCategoryReqState,
      allProductReqState: allProductReqState ?? this.allProductReqState,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      productCategory: productCategory ?? this.productCategory,
      allProducts: allProducts ?? this.allProducts,
      paginatedData: paginatedData ?? this.paginatedData,
      productCategoriesReqState:
      productCategoriesReqState ?? this.productCategoriesReqState,
    );
  }

  @override
  List<Object?> get props =>
      [
        message,
        productByCategory,
        productByCategoryReqState,
        allProductReqState,
        selectedCategory,
        productCategory,
        allProducts,
        paginatedData,
        productCategoriesReqState,
      ];
}

class SelectedProductCategory extends Equatable {
  final int catId;
  final String catName;

  const SelectedProductCategory({
    required this.catId,
    required this.catName,
  });

  @override
  List<Object> get props => [catId, catName];
}
