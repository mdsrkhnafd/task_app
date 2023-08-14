import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../app_exceptions.dart';
import 'BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    if (kDebugMode) {
      print("------------- Test .......");
    }
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
    //  Utils().toastMessage(response.statusCode.toString());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(" No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async {
    //print("------------- Test .......");
    //print("Get Data"+data.toString());

   // print("------------- Test .......");

    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);

     // Utils().toastMessage(response.toString());
    //  Utils().toastMessage(response.statusCode.toString());

    } on SocketException {
      throw FetchDataException(" No Internet Connection");
    }

    return responseJson;
  }

  //return response to APi
  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print("Response => ${response.statusCode}");
    }
    switch (response.statusCode) {
      case 200:

        if (kDebugMode) {
          print(response.body);
        }
        if (response.body == "" || response.body == null){
          return {"status":"200"};
        }
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnAuthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occurred while communication with server" +
                "with status code" +
                response.statusCode.toString());
    }
  }
}
