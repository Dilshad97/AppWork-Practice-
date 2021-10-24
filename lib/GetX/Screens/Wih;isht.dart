// screens/wish_list_screen.dart
import 'package:appwork/GetX/State/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  // Ask Get to find our "controller"
  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final Products _p = Get.find<Products>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('Total items in cart ${_p.wishListItems.length}')),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: _p.wishListItems.isNotEmpty
                  ? Obx(
                      () => ListView.builder(
                        itemCount: _p.wishListItems.length,
                        itemBuilder: (context, index) {
                          final item = _p.wishListItems[index];
                          return Column(
                            children: [
                              Card(
                                key: ValueKey(item.id),
                                margin: EdgeInsets.all(5),
                                color: Colors.blue[200],
                                child: ListTile(
                                  title: Text(item.name),
                                  subtitle: Text(item.price.toStringAsFixed(2)),
                                  // This button use to remove )the item from wish list
                                  trailing: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {
                                      item.inWishList.value = false;
                                      _p.removeItem(item.id);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : Center(child: Text("Noting in cart")),
            ),
          ],
        ));
  }
}
