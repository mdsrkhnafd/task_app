import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:provider/provider.dart';
import 'package:task_app/screens/bottom_Navigation_Screen.dart';
import 'package:task_app/screens/product_screen.dart';

import '../repository/auth_repository.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier
{
  final _myRepo = AuthRepository();



  bool _loginLoading = false;
  bool get loginLoading => _loginLoading ;

  //registration loading
  setLoginLoading(bool value)
  {
    _loginLoading = value;
    notifyListeners() ;
  }


 //patient registration methode
  Future<void> loginApi(dynamic data, BuildContext context) async
  {

    if (kDebugMode) {
      print("Successful Data => $data");
    }

    setLoginLoading(true);

    _myRepo.loginApi(data).then((value) {
      if (kDebugMode) {
        print("Value ======= $value");
      }
      setLoginLoading(false);
     // Utils().toastMessage("Registration Successfully");

      // var res = value;
      // if (kDebugMode) {
      //   print("Response Body => ${res.toString()}");
      // }
      // var randomNumber = res['Random_NO'].toString();
      // var emailAddress = res['Email_Address'].toString();

    //  Utils().toastMessage(randomNumber);


      //Navigate to Home Screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(),));

      if (kDebugMode) {

        print(value.toString());

      }
    }).onError((error, stackTrace) {

      if (kDebugMode) {

        setLoginLoading(false);

        print(error.toString());
        Utils().flushBarErrorMessage("username or password is incorrect", context);
      }
    });
  }



}