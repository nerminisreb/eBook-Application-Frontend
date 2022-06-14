import 'package:ebook/consttants.dart';
import 'package:ebook/screens_to_call/drawer_screen.dart';
import 'package:flutter/material.dart';

class regionScreen extends StatefulWidget {
  const regionScreen({Key? key}) : super(key: key);

  @override
  State<regionScreen> createState() => _regionScreenState();
}

class _regionScreenState extends State<regionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text(
              "region",
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
