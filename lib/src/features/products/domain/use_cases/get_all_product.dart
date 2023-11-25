import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_entity.dart';
import 'package:alnawadi/src/features/products/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProductUseCase extends BaseUseCase<ProductEntity, int> {
  final BaseProductsRepository productsRepository;

  GetAllProductUseCase(this.productsRepository);

  @override
  Future<Either<Failure, ProductEntity>> call(int page) async {
    return await productsRepository.getAllProductCategory(page);
  }
}
