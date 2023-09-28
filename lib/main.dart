import 'package:flutter/material.dart';
import 'package:news/business.dart';
import 'package:news/techcrunch.dart';
import 'package:news/tesla.dart';
import 'package:news/wall.dart';
import 'apple.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsList(),
      routes: {
        '/apple': (context) => Apple(),
        '/tesla': (context) => Tesla(),
        '/business': (context) => Business(),
        '/techcrunch': (context) => TechCrunch(),
        '/journal': (context) => Journal(),
      },
    );
  }
}

class NewsList extends StatelessWidget {
  final List<String> fruits = ['Apple', 'Tesla', 'Business', 'TechCrunch', 'Journal'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Center(child: Text('Welcome!!')),
      ),
      body: ListView.builder(
        itemCount: fruits.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'Choose Topic',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }
          final fruit = fruits[index - 1];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/${fruit.toLowerCase()}');
            },
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: index % 2 == 0 ? Colors.orange : Colors.brown,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 90,
                  child: Center(
                    child: Text(
                      fruit,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
