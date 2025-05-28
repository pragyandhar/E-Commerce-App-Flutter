import 'package:ecommerce_app/models/products.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({
    super.key,
    required this.product,
  });

  // Add to cart button pressed
  void addToCart(BuildContext context) {
    // show a dialog box to ask user to confirm to add to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          "Add this item to your cart",
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
              context.read<Shop>().addToCart(product);
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(157, 255, 255, 255),
                      borderRadius: BorderRadius.circular(12)),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(product.imagePath),
                ),
              ),

              const SizedBox(height: 25),

              // product name
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 8),

              // product description
              Text(
                product.description,
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Product Price
              Text(
                '\$' + product.price.toStringAsFixed(2),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),

              // Add to cart button
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 197, 255),
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
