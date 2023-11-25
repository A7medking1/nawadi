import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_category_entity.dart';
import 'package:alnawadi/src/features/products/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetProductCategoryUseCase
    extends BaseUseCase<ProductCategoryEntity, int> {
  final BaseProductsRepository productsRepository;

  GetProductCategoryUseCase(this.productsRepository);

  @override
  Future<Either<Failure, ProductCategoryEntity>> call(int page) async {
    return await productsRepository.getProductCategory(page);
  }
}
