import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/components/my_drawer.dart';
import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog box to ask user to confirm to add to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Remove this item to your cart",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          // Yes button
          MaterialButton(
            onPressed: () {
              // Pop dialog box
              Navigator.pop(context);

              // Add to Cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text(
              "Yes",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // User pressed Pay Button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content:
            Text("User wants to pay! Connect this app to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 227, 194, 255),
        elevation: 0,
        title: const Text(
          "Your Cart",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: const Text(
                      "YOUR CART IS EMPTY",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      // Get individual items in a cart
                      final item = cart[index];

                      // Return it as a cart tile UI
                      return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => removeItemFromCart(context, item),
                          ));
                    }),
          ),

          // Pay Button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: Center(
                    child: Text(
                  "PAY NOW",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
          )
        ],
      ),
    );
  }
}
