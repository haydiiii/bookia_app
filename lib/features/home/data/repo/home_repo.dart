import 'package:bookia_app/core/constants/constatnts.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/features/home/data/model/response/banner_response/banner_response_model/banner_response_model.dart';
import 'package:bookia_app/features/home/data/model/response/best_seller_resonse/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/features/home/data/repo/home_end_points.dart';

class HomeRepo {
  static Future<BannerResponseModel?> bannerHome() async {
    var url = AppConstants.baseUrl + HomeEndPoints.banner;
    var response = await DioProvider.get(endPoint: url);
    var bannerModel = BannerResponseModel.fromJson(response.data);

    if (response.statusCode == 200) {
      return bannerModel;
    } else {
      return null;
    }
  }
  static Future<BestSellerResponseModel?> bestSeller() async {
    var url = AppConstants.baseUrl + HomeEndPoints.bestSellwr;
    var response = await DioProvider.get(endPoint: url);
    var bestSellerModel = BestSellerResponseModel.fromJson(response.data);

    if (response.statusCode == 200) {
      return bestSellerModel;
    } else {
      return null;
    }
  }
}
