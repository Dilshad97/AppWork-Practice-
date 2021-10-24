// screens/home_screen.dart
import 'package:appwork/GetX/Screens/Wih;isht.dart';
import 'package:appwork/GetX/State/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // Instantiate our Products class using Get.put()
  final Products _p = Get.put(Products());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(WishListScreen());
                  },
                  icon: Icon(Icons.shopping_cart)),
              Obx(() => Positioned(
                right: 10,
                child: Text(
                  '${_p.wishListItems.length}',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              )),
            ],
          )
        ],
        title: Text('Add to cart'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),

          Expanded(
              // Display all products in home screen
              child: ListView.builder(
                  itemCount: _p.items.length,
                  // List item widget
                  itemBuilder: (context, index) {
                    final product = _p.items[index];
                    return Card(
                      key: ValueKey(product.id),
                      margin: EdgeInsets.all(5),
                      color: Colors.amberAccent,
                      child: ListTile(
                        title: Text(product.name),
                        subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                        // Use Obx(()=> to update icon color when product.inWishList change
                        trailing: Obx(() => IconButton(
                              onPressed: () {
                                if (product.inWishList.value == false) {
                                  _p.addItem(product.id);
                                } else {
                                  _p.removeItem(product.id);
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: product.inWishList.value == false
                                    ? Colors.white
                                    : Colors.red,
                              ),
                            )),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
