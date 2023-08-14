
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:task_app/model/product_model.dart';
import 'package:task_app/repository/product_repository.dart';

import '../../data/response/api_response.dart';

class ProductViewViewModel with ChangeNotifier
{

  ProductViewViewModel() {
    initData();
  }

  void initData() async {

    fetchProductData();
  }

  final _myRepo = ProductRepository();

  ApiResponse _apiResponse = ApiResponse.loading();

  List<ProductModel>? _productList = [];

  ApiResponse get response {
    return _apiResponse;
  }
  List<ProductModel>? get productList {
    return _productList;
  }

  /// Call the media service and gets the data of requested media data of an artist.
  Future<void> fetchProductData() async {

    _apiResponse = ApiResponse.loading();
    notifyListeners();

    try {
      List<ProductModel> productList = await _myRepo.fetchAllProductListApi();
      _apiResponse = ApiResponse.completed(productList);
      setSelectedProducts(_apiResponse.data);
    }
    catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      if (kDebugMode) {
        print(e);
      }
    }

    notifyListeners();
  }
  void setSelectedProducts(List<ProductModel> productModel) {

    _productList = productModel;
    notifyListeners();

  }

}