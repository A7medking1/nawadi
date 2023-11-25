import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/core/use_case/base_use_case.dart';
import 'package:alnawadi/src/features/products/domain/entity/product_entity.dart';
import 'package:alnawadi/src/features/products/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetProductByCategoryUseCase
    extends BaseUseCase<ProductEntity, GetProductByCategoryParameters> {
  final BaseProductsRepository productsRepository;

  GetProductByCategoryUseCase(this.productsRepository);

  @override
  Future<Either<Failure, ProductEntity>> call(
      GetProductByCategoryParameters parameters) async {
    return await productsRepository.getProductByCategory(parameters);
  }
}

class GetProductByCategoryParameters extends Equatable {
  final int page;

  final int categoryId;

  const GetProductByCategoryParameters(this.page, this.categoryId);

  @override
  List<Object> get props => [page, categoryId];
}
