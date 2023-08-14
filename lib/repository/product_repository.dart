import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:task_app/model/product_model.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';


class ProductRepository {

  BaseApiServices _apiServices = NetworkApiService();

  // Products List Method
  Future<List<ProductModel>> fetchAllProductListApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(AppUrl.allProductsEndPoint);
      final jsonData = response as List;
      List<ProductModel> dashboardList =
      jsonData.map((tagJson) => ProductModel.fromJson(tagJson)).toList();

    //  Utils().toastMessage(dashboardList.length.toString());
      return dashboardList;
    } catch (e) {
      throw e;
    }
  }


}