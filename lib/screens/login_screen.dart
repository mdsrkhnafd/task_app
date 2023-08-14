import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_app/consts/round_button.dart';
import 'package:task_app/screens/product_details_screen.dart';
import 'package:task_app/screens/product_screen.dart';

import '../consts/my_validators.dart';
import '../view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      final authViewModel = Provider.of<AuthViewModel>(context , listen: false);
      Map data = {
        "username": _emailController.text.trim().toString(),
        "password": _passwordController.text.trim().toString()
      };
      authViewModel.loginApi(data, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context , listen: false);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Login Screens"),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: 100.w,
              height: 45.h,
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Center(
                      child: Text(
                    "STC\nHEALTH",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2),
                  )),
                  const Spacer(),
                  const Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 3.h,
                  )
                ],
              ),
            ),
            Container(
              height: 55.h,
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: Column(children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          label: Text("Email"),
                          suffixIcon: Icon(
                            Icons.check_circle_outline,
                            color: Colors.blue,
                          ),),
                      validator: (value) {
                        return MyValidators.emailValidator(value);
                      },
                      onFieldSubmitted: (value) {
                        _loginFct();
                      },
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                          label: Text("Password"),
                          hintText: "*********",
                          hintStyle: TextStyle(color: Colors.black),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Colors.blue,
                          ),
                      ),
                      validator: (value) {
                        return MyValidators.passwordValidator(value);
                      },
                      onFieldSubmitted: (value) {
                        _loginFct();
                      },
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: RoundButton(
                        title: 'Continue',
                        loading: authViewModel.loginLoading,
                        onPress: () {
                          _loginFct();
                        },
                      )),
                  SizedBox(height: 5.h,),
                  const Center(child: Text("NEED HELP?" , style: TextStyle(fontSize: 20,color: Colors.black),),),
                  SizedBox(height: 5.h,),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
