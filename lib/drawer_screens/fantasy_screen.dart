import 'package:ebook/consttants.dart';
import 'package:ebook/screens_to_call/drawer_screen.dart';
import 'package:flutter/material.dart';

class fantasyScreen extends StatefulWidget {
  const fantasyScreen({Key? key}) : super(key: key);

  @override
  State<fantasyScreen> createState() => _fantasyScreenState();
}

class _fantasyScreenState extends State<fantasyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Text(
              "fantasy",
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
