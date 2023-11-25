import 'package:alnawadi/src/features/home/data/model/banner_model.dart';
import 'package:alnawadi/src/features/home/data/model/search_model.dart';
abstract class HomeBaseRemoteDataSource {
  Future<List<BannerModel>> getBanners();

  Future<List<SearchModel>> getSearchProduct(String query);

  Future<List<SearchModel>> getSearchActivity(String query);
}
