import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home/homepage.dart';
import 'product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        // ✅ Yahan routes define karo
        //GetPage(name: '/product', page: () => ProductPage()),
      ],
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
