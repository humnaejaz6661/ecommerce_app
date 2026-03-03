import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../product_model.dart';
import 'controller.dart';

class HomepageComponents {
  static Widget productCardWidget({
    required ProductModel product,
    required HomeViewController favController,
    VoidCallback? onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (product.label != null && product.label!.isNotEmpty)
                    Positioned(
                      top: 8,
                      left: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Text(
                          product.label!,
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Obx(
                      () => GestureDetector(
                          onTap: () =>
                              favController.toggleFavourite(product.id),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 157, 150, 150),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              favController.isFavourite(product.id)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: 20,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                        color: Colors.grey[700], fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget iconDecoration(Icon icon) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 238, 238),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        onPressed: () {},
        icon: Icon(
          icon.icon,
          size: 22,
          color: icon.color,
        ),
      ),
    );
  }

  static Widget textImage(String imgpath, String title) {
    return Container(
      width: 110,
      margin: EdgeInsets.only(right: 10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imgpath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            left: 25,
            child: Container(
              // color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  static Widget categoryButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    double width = 150,
    double height = 50,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSelected ? Colors.black : Color.fromARGB(255, 242, 238, 238),
          border: Border.all(color: Colors.black, width: 0.4),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

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
}
