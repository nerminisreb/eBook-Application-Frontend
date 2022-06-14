import 'package:ebook/consttants.dart';
import 'package:ebook/screens_to_call/drawer_screen.dart';
import 'package:flutter/material.dart';

class foreignBooks extends StatefulWidget {
  foreignBooks({Key? key}) : super(key: key);

  @override
  State<foreignBooks> createState() => _foreignBooksState();
}

class _foreignBooksState extends State<foreignBooks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text(
              "forrrr",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          title: const Text('Foreign Books'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
