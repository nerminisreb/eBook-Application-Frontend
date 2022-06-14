import 'package:ebook/consttants.dart';
import 'package:ebook/screens_to_call/drawer_screen.dart';

import 'package:flutter/material.dart';

class shopScreen extends StatefulWidget {
  const shopScreen({Key? key}) : super(key: key);

  @override
  State<shopScreen> createState() => _shopScreenState();
}

class _shopScreenState extends State<shopScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text(
              "Shop",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          title: const Text('My Shopping'),
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
