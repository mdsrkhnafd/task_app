
class AppUrl
{
  // this is our base url
  static const String baseUrl = 'https://fakestoreapi.com/';

                    //Patient Side App

  //static const String loginEndPoint = baseUrl
  static const String loginEndPoint = '${baseUrl}auth/login';


  //display all Products Done
  static const String allProductsEndPoint = '${baseUrl}products';

  //display all Products Done
  static const String allProductsEndPointById = '${baseUrl}products/1';



}