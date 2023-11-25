import 'package:alnawadi/src/core/error/exceptions.dart';
import 'package:alnawadi/src/core/error/failures.dart';
import 'package:alnawadi/src/features/order/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/order/data/models/create_order_model.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_details_entity.dart';
import 'package:alnawadi/src/features/order/domain/entity/order_entity.dart';
import 'package:alnawadi/src/features/order/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class OrderRepository extends BaseOrderRepository {
  final BaseOrderRemoteDataSource remoteDataSource;

  OrderRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<OrderEntity>>> getUserOrder() async {
    try {
      final result = await remoteDataSource.getUserOrder();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, OrderDetailsEntity>> getOrderById(int orderId) async {
    try {
      final result = await remoteDataSource.getOrderById(orderId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
  @override
  Future<Either<Failure, void>> cancelOrder(int orderId) async {
    try {
      final result = await remoteDataSource.cancelOrder(orderId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> createOrder(CreateOrderModel model) async {
    try {
      final result = await remoteDataSource.createOrder(model);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel!.statusMessage));
    }
  }
}
