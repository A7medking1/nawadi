import 'package:alnawadi/src/features/products/data/model/product_category_model.dart';
import 'package:alnawadi/src/features/products/data/model/product_model.dart';
import 'package:alnawadi/src/features/products/domain/use_cases/get_product_by_category.dart';

abstract class ProductsBaseRemoteDataSource {
  Future<ProductCategoryModel> getProductCategory(int page);

  Future<ProductModel> getAllProduct(int page);

  Future<ProductModel> getProductByCategory(
    GetProductByCategoryParameters parameters,
  );
}
