import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cart_screen.dart';
import './category_screen.dart';
import './cart_screen.dart';
import '../../providers/cart_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //   },
        // ),
        centerTitle: true,
        title: Text('Food App'),
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
      body: Column(
        //  GridView(
        //   padding: EdgeInsets.all(10),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     childAspectRatio: 2,
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //   ),
        children: [
          CategoryCard(
              'Breakfast', 'breakfast', 'assets/images/breakfastHomeImg.jfif'),
          CategoryCard('Lunch', 'lunch', 'assets/images/lunchHomeImg.jfif'),
          CategoryCard('Snacks', 'snacks', 'assets/images/snacksHomeImg.jfif'),
          CategoryCard('Dinner', 'dinner', 'assets/images/dinnerHomeImg.jfif'),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String category;
  final String imageName;

  CategoryCard(this.title, this.category, this.imageName);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(16),
      child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryScreen(category),
              ),
            );
          },
          child: Row(
            children: [
              Image.asset(
                imageName,
                width: 100,
                height: 100,
              ),
              SizedBox(width: 20),
              Text(title,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ],
          )),
    ));
  }
}
