import 'package:ebook/consttants.dart';
import 'package:ebook/drawer_screens/biyography_screen.dart';
import 'package:ebook/drawer_screens/fantasy_screen.dart';
import 'package:ebook/drawer_screens/literature_screen.dart';
import 'package:ebook/drawer_screens/novels_screen.dart';
import 'package:ebook/drawer_screens/region_screen.dart';
import 'package:ebook/screens_to_call/drawer_screen.dart';
import 'package:flutter/material.dart';

class internalBooks extends StatefulWidget {
  internalBooks({Key? key}) : super(key: key);

  @override
  State<internalBooks> createState() => _internalBooksState();
}

class _internalBooksState extends State<internalBooks> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          title: const Text('Internal Books'),
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
                      MaterialPageRoute(builder: (context) => novelsScreen()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Novels",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(
                  color: kProgressIndicator,
                ),
                /////////////////////////////////////////////////////////////

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => fantasyScreen()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Fantasy",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(
                  color: kProgressIndicator,
                ),
                /////////////////////////////////////////////////

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => regionScreen()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Region",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(
                  color: kProgressIndicator,
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => literatureScreen()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Literature",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(
                  color: kProgressIndicator,
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => biyographyScreen()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      "Biography",
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
