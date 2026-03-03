import 'package:e_commerce_app/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../product.dart';
import 'controller.dart';
import 'homepage_components.dart';

// final List<ProductModel> product = [
//   ProductModel(
//       id: '1', name: 'Bike', imageUrl: 'assets/images/necklace.jpg', price: 20),
//   ProductModel(
//       id: '1', name: 'Bike', imageUrl: 'assets/images/necklace.jpg', price: 20),
//   ProductModel(
//       id: '1', name: 'Bike', imageUrl: 'assets/images/necklace.jpg', price: 20),
//   ProductModel(
//       id: '1', name: 'Bike', imageUrl: 'assets/images/necklace.jpg', price: 20),
// ];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedCategory = "Featured Collection";
  // HomepageComponents homepageComponents=MyHomePage(title: )
  final HomeViewController homeViewController = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "LUXENOIRE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          shape: Border(
              bottom: BorderSide(
                  color: const Color.fromARGB(255, 242, 238, 238), width: 1.5)),
          actions: [
            HomepageComponents.iconDecoration(
                Icon(Icons.shopping_bag_outlined)),
            HomepageComponents.iconDecoration(
                Icon(Icons.favorite_border_outlined)),
            HomepageComponents.iconDecoration(Icon(Icons.search_outlined)),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Shop by Categories",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: index == 0 ? 16 : 0),
              child: SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeViewController.categories.length,
                  itemBuilder: (context, index) {
                    final category = homeViewController.categories[index];
                    return HomepageComponents.textImage(
                        category.image, category.title);
                  },
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Shop by Recommendation",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    itemCount: homeViewController.collection.length,
                    itemBuilder: (context, index) {
                      final title = homeViewController.collection[index];
                      return Row(
                        children: [
                          HomepageComponents.categoryButton(
                            title: title,
                            isSelected: selectedCategory == title,
                            onTap: () {
                              setState(() {
                                selectedCategory = title;
                              });
                            },
                            width: 170,
                          ),
                          SizedBox(width: 8),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: homeViewController.products.length,
                itemBuilder: (context, index) {
                  final productMap = homeViewController.products[index];
                  final productObj = ProductModel(
                    id: productMap['id'],
                    name: productMap['name'],
                    imageUrl: productMap['imageUrl'],
                    price: productMap['price'].toDouble(),
                    label: productMap['label'],
                  );

                  return HomepageComponents.productCardWidget(
                    product: productObj,
                    favController: homeViewController,
                    onTap: () => Get.to(() => ProductPage(product: productObj)),
                  );
                },
              ),
            ),
          ],
        )));
  }
}
