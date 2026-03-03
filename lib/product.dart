import 'package:e_commerce_app/home/homepage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'home/controller.dart';
import 'product_model.dart';

class ProductPage extends StatelessWidget {
  final ProductModel product;

  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final HomeViewController homeViewController =
        Get.find<HomeViewController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 19.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[200],
            child: IconButton(
              padding: const EdgeInsets.all(4.0),
              icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "DETAIL PRODUCT",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: IconButton(
                padding: const EdgeInsets.all(4.0),
                onPressed: () {},
                icon:
                    const Icon(Icons.more_vert, color: Colors.black, size: 20),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  product.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1.2),
                    ),
                  ),
                  Obx(() {
                    bool isFav = homeViewController.isFavourite(product.id);
                    return GestureDetector(
                      onTap: () =>
                          homeViewController.toggleFavourite(product.id),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "This ${product.name} is a premium quality item. Price: \$${product.price}. High-end craftsmanship for the modern look.",
                style: TextStyle(
                    fontSize: 14, color: Colors.grey[600], height: 1.5),
              ),
              const SizedBox(height: 25),
              const Text(
                "Color Variant:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  buildColorCircle(Colors.black, homeViewController),
                  buildColorCircle(const Color(0xFFC0C0C0), homeViewController),
                  buildColorCircle(const Color(0xFF2E5A39), homeViewController),
                  buildColorCircle(const Color(0xFF2E5EA3), homeViewController),
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: buildBottomBar(product.price, homeViewController),
    );
  }

  Widget buildBottomBar(double price, HomeViewController controller) {
    return Obx(() => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          color: Colors.white,
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: controller.selectedColor.value,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text("\$$price",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text("Add to Bag",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget buildColorCircle(Color color, HomeViewController controller) {
  return GestureDetector(
    onTap: () => controller.changeColor(color),
    child: Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300, width: 1.5),
      ),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: color,
      ),
    ),
  );
}
