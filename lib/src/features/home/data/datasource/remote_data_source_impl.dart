import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/api/api_consumer.dart';
import 'package:alnawadi/src/features/home/data/datasource/remote_data_source.dart';
import 'package:alnawadi/src/features/home/data/model/banner_model.dart';
import 'package:alnawadi/src/features/home/data/model/search_model.dart';

class HomeRemoteDataSourceImpl extends HomeBaseRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<List<BannerModel>> getBanners() async {
    final response = await apiConsumer.get(ApiConstant.banners);
    return List<BannerModel>.from(
      (response.data["banners"] as List).map(
        (e) => BannerModel.fromJson(e),
      ),
    );
  }

  @override
  Future<List<SearchModel>> getSearchActivity(String query) async {
    final response =
    await apiConsumer.post(ApiConstant.searchActivities, queryParameters: {
      'lang': 'ar',
      'keyword': query,
    });
    return List<SearchModel>.from(
      (response.data['activities']['data']).map(
            (e) => SearchModel.fromJson(e),
      ),
    );
  }

  @override
  Future<List<SearchModel>> getSearchProduct(String query) async {
    final response =
        await apiConsumer.post(ApiConstant.searchProduct, queryParameters: {
      'lang': 'ar',
      'keyword': query,
    });
    return List<SearchModel>.from(
      (response.data['products']['data']).map(
        (e) => SearchModel.fromJson(e),
      ),
    );
  }
}
