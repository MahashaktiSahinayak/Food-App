import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/home_page.dart' show rootBundle;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<HomePage> {
  late Future<void> _newsList;
  Map<String, dynamic> jsonData = {};

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/news.json');
    print(response);
    final data = await json.decode(response);
    setState(() {
      jsonData = data;
      print(jsonData);
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
    _newsList = loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyNews',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFFFFFFF),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.location_on),
            color: Colors.white,
            tooltip: "IN  ",
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                "IN",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins-Regular",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xFF0C54BE),
      ),
      body: ListView.builder(
        itemCount: 100,
        // itemCount: jsonData["articles"].length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jsonData["articles"][index]["source"]["name"],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins-Regular",
                                fontSize: 16),
                          ),
                          Text(
                            jsonData["articles"][index]["title"],
                            style: TextStyle(
                                fontFamily: "Poppins-Regular", fontSize: 16),
                            maxLines: 2,
                          ),
                          Text(
                            jsonData["articles"][index]["publishedAt"],
                            style: TextStyle(color: Colors.grey),
                          ),
                        ]),
                  ),
                  SizedBox(width: 10),
                  Image.network(
                    // 'https://images.pexels.com/photos/56866/garden-rose-red-pink-56866.jpeg?auto=compress&cs=tinysrgb&w=600',
                    jsonData["articles"][index]["urlToImage"],
                    height: 100,
                    width: 100,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class newsCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
