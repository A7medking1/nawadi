import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/api/api_consumer.dart';
import 'package:alnawadi/src/features/order/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/order/data/models/create_order_model.dart';
import 'package:alnawadi/src/features/order/data/models/order_details_model.dart';
import 'package:alnawadi/src/features/order/data/models/order_model.dart';
import 'package:dio/dio.dart';

class OrderRemoteDataSource extends BaseOrderRemoteDataSource {
  final ApiConsumer apiConsumer;

  OrderRemoteDataSource(this.apiConsumer);

  @override
  Future<void> cancelOrder(int orderId) async {
    //final Response response =
    await apiConsumer.post(ApiConstant.cancelOrder, queryParameters: {
      'order_id': orderId,
    });
  }

  @override
  Future<void> createOrder(CreateOrderModel model) async {
    final Response response = await apiConsumer.get(
      ApiConstant.createOrder,
      queryParameters: model.toJson(),
    );
  }

  @override
  Future<List<OrderModel>> getUserOrder() async {
    final Response response = await apiConsumer.get(
      ApiConstant.getUserOrders,
    );
    return List<OrderModel>.from(
        (response.data['orders']).map((e) => OrderModel.fromJson(e)));
  }

  @override
  Future<OrderDetailsModel> getOrderById(int orderId) async {
    final Response response = await apiConsumer.get(
      ApiConstant.orderDetails(orderId),
    );

    return OrderDetailsModel.fromJson(response.data['order']);
  }
}
