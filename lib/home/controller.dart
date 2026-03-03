//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:e_commerce_app/homepage.dart';
import '../product_model.dart';

class HomeViewController extends GetxController {
  Rx<Color> selectedColor = const Color(0xFF2D2D2D).obs;
  void changeColor(Color color) {
    selectedColor.value = color;
  }

  var favourites = <String>[].obs;

  void toggleFavourite(String productId) {
    if (favourites.contains(productId)) {
      favourites.remove(productId);
    } else {
      favourites.add(productId);
    }
  }

  bool isFavourite(String productId) => favourites.contains(productId);

  final List<Category> categories = [
    Category(image: 'assets/images/Jewlery.jpg', title: 'Jewelry'),
    Category(image: 'assets/images/perfume.jpg', title: 'Perfume'),
    Category(image: 'assets/images/bag.jpg', title: 'Bag'),
    Category(image: 'assets/images/acc.jpg', title: 'Accessories'),
  ];

  final List<Map<String, dynamic>> products = [
    {
      'id': 'p1',
      'name': 'Flower Necklace',
      'imageUrl': 'assets/images/necklace.jpg',
      'price': 50.0,
      'label': '50% OFF',
    },
    {
      'id': 'p2',
      'name': 'Perfume Bottle',
      'imageUrl': 'assets/images/perfume.jpg',
      'price': 35.0,
    },
    {
      'id': 'p3',
      'name': 'Watch',
      'imageUrl': 'assets/images/watches.jpg',
      'price': 50.0,
    },
    {
      'id': 'p4',
      'name': 'PIXI Tint',
      'imageUrl': 'assets/images/perfume.jpg',
      'price': 325.0,
      'label': 'EXCLUSIVE',
    },
    {
      'id': 'p5',
      'name': 'Key Chain',
      'imageUrl': 'assets/images/keychain.jpg',
      'price': 50.0,
    },
    {
      'id': 'p6',
      'name': 'Ring',
      'imageUrl': 'assets/images/ring.jpg',
      'price': 35.0,
    },
    {
      'id': 'p7',
      'name': 'Glasses',
      'imageUrl': 'assets/images/glasses.jpg',
      'price': 50.0,
    },
    {
      'id': 'p8',
      'name': 'Clip',
      'imageUrl': 'assets/images/clip.jpg',
      'price': 35.0,
    },
  ];
  List<String> collection = [
    "Featured Collection",
    "Upto 50% Off",
    "Exclusive Collection",
  ];
}
