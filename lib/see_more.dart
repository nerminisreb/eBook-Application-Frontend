import 'package:ebook/consttants.dart';
import 'package:ebook/screens_to_call/drawer_screen.dart';
import 'package:flutter/material.dart';

class seeMore extends StatefulWidget {
  seeMore({Key? key}) : super(key: key);

  @override
  State<seeMore> createState() => _seeMoreState();
}

class _seeMoreState extends State<seeMore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: hava(),

        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          title: const Text('See More'),
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
