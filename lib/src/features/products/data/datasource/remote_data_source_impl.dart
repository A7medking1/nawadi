import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/api/api_consumer.dart';
import 'package:alnawadi/src/features/products/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/products/data/model/product_category_model.dart';
import 'package:alnawadi/src/features/products/data/model/product_model.dart';
import 'package:alnawadi/src/features/products/domain/use_cases/get_product_by_category.dart';
import 'package:dio/dio.dart';

class ProductsRemoteDataSourceImpl extends ProductsBaseRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProductsRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<ProductModel> getAllProduct(int page) async {
    final Response response = await apiConsumer.get(ApiConstant.products(page));

    return ProductModel.fromJson(response.data['products']);
  }

  @override
  Future<ProductModel> getProductByCategory(
      GetProductByCategoryParameters parameters) async {
    final Response response = await apiConsumer.get(
      ApiConstant.productByCategory(
        parameters.page,
        parameters.categoryId,
      ),
    );

    return ProductModel.fromJson(response.data['products']);
  }

  @override
  Future<ProductCategoryModel> getProductCategory(int page) async {
    final Response response =
        await apiConsumer.get(ApiConstant.productCategories(page));

    return ProductCategoryModel.fromJson(response.data['categories']);
  }
}
