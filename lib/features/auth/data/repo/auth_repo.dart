import 'dart:convert';
import 'dart:developer';

import 'package:bookia_app/core/constants/constatnts.dart';
import 'package:bookia_app/core/services/dio_provider.dart';
import 'package:bookia_app/features/auth/data/model/request/login_model_params.dart';
import 'package:bookia_app/features/auth/data/model/request/register_model_params.dart';
import 'package:bookia_app/features/auth/data/model/response/auth_response_model/auth_response_model.dart';
import 'package:bookia_app/features/auth/data/repo/auth_end_points.dart';

class AuthRepo {
  /////////////////login////////
  static Future<AuthResponseModel?> login(LoginModelParams params) async {
    try {
      var url = AppConstants.baseUrl + AuthEndPoints.login;
      var rsponse =
          await DioProvider.post(endPoint: url, data: params.toJson());

      var model = AuthResponseModel.fromJson(rsponse.data);
      if (rsponse.statusCode == 200) {
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  /////////////register///////////
  static Future<AuthResponseModel?> register(RegisterModelParams params) async {
    try {
      var url = AppConstants.baseUrl + AuthEndPoints.register;
      var response =
          await DioProvider.post(endPoint: url, data: params.toJson());
      var model = AuthResponseModel.fromJson(response.data);
      if (response.statusCode == 201) {
        return model;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
