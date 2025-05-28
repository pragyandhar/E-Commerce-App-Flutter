import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/components/my_product_tile.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 227, 194, 255),
        elevation: 0,
        title: const Text(
          "Your Shop",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          // Go to cart button
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 25),
          // Shop Subtitle
          Center(
            child: Text(
              "Pick from the selected list of premium products",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),

          // Product List
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(15),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  // get each individual product from the shop
                  final product = products[index];

                  // return it as a product tile UI
                  return MyProductTile(product: product);
                }),
          ),
        ],
      ),
    );
  }
}
