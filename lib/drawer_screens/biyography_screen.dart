import 'package:ebook/consttants.dart';
import 'package:ebook/screens_to_call/drawer_screen.dart';
import 'package:flutter/material.dart';

class biyographyScreen extends StatefulWidget {
  const biyographyScreen({Key? key}) : super(key: key);

  @override
  State<biyographyScreen> createState() => _biyographyScreenState();
}

class _biyographyScreenState extends State<biyographyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text(
              "bio",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          title: const Text('search'),
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
