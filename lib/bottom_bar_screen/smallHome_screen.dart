import 'package:ebook/consttants.dart';
import 'package:ebook/database/infData.dart';
import 'package:ebook/drawer_screens/settings_screen.dart';
import 'package:ebook/screens_to_call/book_card_tow.dart';
import 'package:ebook/screens_to_call/details_screen.dart';
import 'package:ebook/screens_to_call/drawer_screen.dart';
import 'package:ebook/see_more.dart';
import 'package:flutter/material.dart';

import 'package:ebook/screens_to_call/book.dart';
import 'package:ebook/screens_to_call/book_card.dart';
import 'package:ebook/screens_to_call/sliver_appbar.dart';
import 'package:ebook/screens_to_call/word.dart';

class smallHomeScreen extends StatefulWidget {
  var idKey;
  smallHomeScreen({required this.idKey});

  @override
  State<smallHomeScreen> createState() => _smallHomeScreenState();
}

class _smallHomeScreenState extends State<smallHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: ClipPath(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            width: 220,
            height: double.infinity,
            child: drawerScreen(
              idKey: widget.idKey,
            ),
          ),
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            sliverAppbar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: 600,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "  New Arrivals",
                              style: TextStyle(
                                color: kProgressIndicator,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => seeMore(),
                                  ),
                                );
                              },
                              child: Text(
                                "See More  ",
                                style: TextStyle(
                                  color: kLightBlackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true, // Use  children total size
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(
                              left: 8.0,
                              top: 10.0,
                              right: 8.0,
                            ),
                            children: [
                              BookCard(
                                id: 0,
                                idKey: widget.idKey,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 1,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 2,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 3,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "  Top Trends",
                              style: TextStyle(
                                color: kProgressIndicator,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => seeMore(),
                                  ),
                                );
                              },
                              child: Text(
                                "See More  ",
                                style: TextStyle(
                                  color: kLightBlackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: ListView(
                            physics: BouncingScrollPhysics(),

                            shrinkWrap: true, // Use  children total size
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(
                              left: 8.0,
                              top: 10.0,
                              right: 5.0,
                            ),
                            children: [
                              BookCard(
                                idKey: widget.idKey,
                                id: 4,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 5,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 6,
                              ),
                              BookCard(
                                idKey: widget.idKey,
                                id: 7,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
