import 'package:flutter/material.dart';
import 'package:gentext/main_controller.dart';
import 'package:gentext/main_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const MainPage(), binding: MainBinding()),
      ],
    );
  }
}

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
