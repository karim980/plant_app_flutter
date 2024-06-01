import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/src/controller/cart_controller.dart';
import 'package:plant_app/src/view/home_screen.dart';

void main() {
  runApp(const MyApp());
  Get.put<CartController>(CartController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.grey),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white
        ),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white)
      ),
      initialBinding: BindingsBuilder(() {
        Get.put<CartController>(CartController());
      }),
      home: HomeScreen(),
    );
  }
}
