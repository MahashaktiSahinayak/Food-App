import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/item.dart';
import '../../models/cart_item.dart';
import '../../providers/cart_provider.dart';
import './cart_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  CategoryScreen(this.category);

  @override
  Widget build(BuildContext context) {
    final items = _getItemsForCategory(category);

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('\Rs ${item.price.toStringAsFixed(2)}/-'),
            trailing: ElevatedButton(
              onPressed: () {
                final cartProvider =
                    Provider.of<CartProvider>(context, listen: false);
                cartProvider.addItem(CartItem(item: item));
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('${item.name} added to cart')),
                // );
              },
              child: Text('Add'),
            ),
          );
        },
      ),
    );
  }

  List<Item> _getItemsForCategory(String category) {
    switch (category) {
      case 'breakfast':
        return [
          Item(name: 'Idli', price: 30),
          Item(name: 'Dosa', price: 40),
          Item(name: 'Dahibara', price: 35),
          Item(name: 'Upma', price: 25),
          Item(name: 'Vada', price: 25),
          Item(name: 'Alu Paratha', price: 40),
        ];
      case 'lunch':
        return [
          Item(name: 'Veg Meal', price: 80),
          Item(name: 'Chicken Meal', price: 100),
          Item(name: 'Mutton Meal', price: 200),
          Item(name: 'Chicken Biriyani', price: 150),
          Item(name: 'Mutton Biriyani', price: 250),
        ];
      case 'snacks':
        return [
          Item(name: 'PaniPuri', price: 20),
          Item(name: 'Samosa', price: 15),
          Item(name: 'Chhole Bhature', price: 40),
          Item(name: 'Noodles', price: 60),
          Item(name: 'Chilli Chicken', price: 70),
          Item(name: 'Chicken Pakoda', price: 60),
        ];
      case 'dinner':
        return [
          Item(name: 'Rot', price: 10),
          Item(name: 'Sabji', price: 30),
          Item(name: 'Fried Rice', price: 60),
          Item(name: 'Chilli Gobi', price: 70),
          Item(name: 'Dalma', price: 40),
        ];
      default:
        return [];
    }
  }
}
