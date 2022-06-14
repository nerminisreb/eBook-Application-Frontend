import 'package:ebook/consttants.dart';

import 'package:ebook/foreign_books.dart';
import 'package:ebook/grafik/grafik.dart';
import 'package:ebook/hava.dart';
import 'package:ebook/internal_books.dart';
import 'package:ebook/screens_to_call/drawer_screen.dart';
import 'package:flutter/material.dart';

class categoriesScreen extends StatefulWidget {
  const categoriesScreen({Key? key}) : super(key: key);

  @override
  State<categoriesScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          title: const Text('Categories'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Container(
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => foreignBooks()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Foreign Books",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(
                  color: kProgressIndicator,
                ),
                ////////////////////////////////////
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => internalBooks()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Internal Books",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(
                  color: kProgressIndicator,
                ),
                //////////////////////////////////////////
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => grafik()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Statistics",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(
                  color: kProgressIndicator,
                ),
                ////////////////////////////////////////////////
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => hava()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Weather",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(
                  color: kProgressIndicator,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
