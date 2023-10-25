import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task_app/screens/bottom_Navigation_Screen.dart';
import 'package:task_app/screens/login_screen.dart';
import 'package:task_app/screens/product_details_screen.dart';
import 'package:task_app/screens/product_screen.dart';
import 'package:task_app/view_model/auth_view_model.dart';
import 'package:task_app/view_model/product_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => ProductViewViewModel()),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
          bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent)
            ),
            //.....
            home: const LoginScreen(),
          );
        }
      ),
    );
  }/////
}

