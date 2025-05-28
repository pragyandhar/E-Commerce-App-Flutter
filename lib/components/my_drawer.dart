import 'package:ecommerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Drawer header
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Shop Tile
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // Cart Tile
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart_outlined,
                onTap: () {
                  // pop drawer first
                  Navigator.pop(context);

                  // go to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          // Exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
