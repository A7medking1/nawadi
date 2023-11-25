import 'package:alnawadi/src/features/order/data/models/create_order_model.dart';
import 'package:alnawadi/src/features/order/data/models/order_details_model.dart';
import 'package:alnawadi/src/features/order/data/models/order_model.dart';

abstract class BaseOrderRemoteDataSource {
  Future<void> createOrder(CreateOrderModel model);

  Future<void> cancelOrder(int orderId);

  Future<List<OrderModel>> getUserOrder();
  Future<OrderDetailsModel> getOrderById(int orderId);

}
