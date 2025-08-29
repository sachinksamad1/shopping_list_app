// lib/cart_screen.dart

import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;

  const CartScreen({super.key, required this.cartItems});

  // Calculate the total price of items in the cart
  double get _totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping List'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Your cart is empty! 😔',
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        leading: Image.network(item.thumbnail, width: 50),
                        title: Text(item.title),
                        trailing: Text('\$${item.price.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                const Divider(thickness: 2),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${_totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}