import 'package:ecommerce_app/models/products.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    // Product 1
    Product(
        name: "Brandon Rohit Cap",
        price: 5499,
        description:
            "A premium-quality cap designed for style and comfort. Perfect for casual outings or sports, it features a sleek design and durable fabric to keep you looking sharp.",
        imagePath: 'assets/cap.jpg'),
    // Product 2
    Product(
        name: "Avengers Hoodie",
        price: 7439,
        description:
            "A cozy and stylish hoodie featuring your favorite Avengers design. Perfect for everyday wear, it combines comfort and durability to keep you warm and fashionable.",
        imagePath: 'assets/hoodie.jpg'),
    // Product 3
    Product(
        name: "Nonsense Phone",
        price: 30512,
        description:
            "A cutting-edge smartphone with a sleek design, powerful performance, and advanced features. Perfect for staying connected and productive on the go.",
        imagePath: 'assets/mobile.jpg'),
    // Product 4
    Product(
        name: "MC Stan Watch",
        price: 20738,
        description:
            "A premium watch that combines elegance and functionality. Perfect for making a bold statement, it features a sleek design and precise craftsmanship.",
        imagePath: 'assets/watch.jpg'),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
