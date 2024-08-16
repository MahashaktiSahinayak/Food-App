import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import 'package:input_quantity/input_quantity.dart';
import 'dart:math';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartProvider.items.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (ctx, index) {
                final cartItem = cartProvider.items[index];
                return cartItem.quantity > 0
                    ? ListTile(
                        title: Text(
                          cartItem.item.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            '\Rs ${cartItem.item.price.toStringAsFixed(2)} x ${cartItem.quantity}'),
                        trailing: InputQty(
                          maxVal: double.maxFinite, //max val to go
                          initVal: cartItem.quantity,
                          onQtyChanged: (val) {
                            // double x = val;
                            cartItem.quantity = val / 2;
                            cartProvider.addItem(cartItem);
                          },
                        ),
                      )
                    : null;
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Total: \Rs ${cartProvider.totalPrice.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
