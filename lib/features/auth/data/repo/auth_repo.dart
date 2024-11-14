import 'dart:developer';

import 'package:bookia_app/core/constants/constatnts.dart';
import 'package:bookia_app/features/auth/data/model/request/login_model_params.dart';
import 'package:bookia_app/features/auth/data/model/request/register_model_params.dart';
import 'package:bookia_app/features/auth/data/repo/auth_end_points.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  /////////////////login////////
 static  Future <bool>login(LoginModelParams params) async{
    try {
  var url = Uri.parse(AppConstants.baseUrl + AuthEndPoints.login);
  var rsponse =await  http.post(url, body: params.toJson());
  if (rsponse.statusCode == 200) {
    return true;
  }else{
    return false;
  }
} on Exception catch (e) {
    log(e.toString());
  return false;
  
}
  }
  /////////////register///////////
  static Future<bool >register(RegisterModelParams params)async{
    try {
  var url =Uri.parse(AppConstants.baseUrl+AuthEndPoints.register);
  var response =await http.post(url, body: params.toJson());
  if (response.statusCode == 200) {
    return true;
  }else{
    return false;
  }
} on Exception catch (e) {
    log(e.toString());
  return false;
  }

  }
}
