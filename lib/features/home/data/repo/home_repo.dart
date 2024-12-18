import 'package:bookia_app/core/constants/constatnts.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/core/services/local_storage.dart';
import 'package:bookia_app/features/home/data/model/response/banner_response/banner_response_model/banner_response_model.dart';
import 'package:bookia_app/features/home/data/model/response/best_seller_resonse/best_seller_response_model/best_seller_response_model.dart';
import 'package:bookia_app/features/home/data/model/response/get_wishlist_response/get_wishlist/get_wishlist.dart';
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

   static Future<GetWishlist?> getWishList() async {
     var url = AppConstants.baseUrl + HomeEndPoints.getWishList;
     var response = await DioProvider.get(
       endPoint: url,
       headers: {
         "Authorization":
             "Bearer ${AppLocalStorage.getCachData(key: AppLocalStorage.token)}",
       },
     );
     var getWishListModel = GetWishlist.fromJson(response.data);
     if (response.statusCode == 200) {
       return getWishListModel;
     } else {
       return null;
     }
   }
  static Future<bool?> addToWishList({required int productId}) async {
    var url = AppConstants.baseUrl + HomeEndPoints.addToWishList;

    try {
      var response = await DioProvider.post(
        endPoint: url,
        data: {"product_id": productId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachData(key: AppLocalStorage.token)}",
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  static Future<bool?> removefromWishList({required int productId}) async {
    var url = AppConstants.baseUrl + HomeEndPoints.removeFromWishList;

    try {
      var response = await DioProvider.post(
        endPoint: url,
        data: {"product_id": productId},
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachData(key: AppLocalStorage.token)}",
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
