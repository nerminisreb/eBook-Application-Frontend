import 'package:ebook/api/techNewsScreen.dart';
import 'package:ebook/bottom_bar_screen/smallHome_screen.dart';
import 'package:ebook/drawer_screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:ebook/consttants.dart';

import 'package:ebook/bottom_bar_screen/myAccount_screen.dart';
import 'package:ebook/bottom_bar_screen/myFav_screen.dart';
import 'package:ebook/bottom_bar_screen/shop_screen.dart';

import 'package:ebook/bottom_bar_screen/categories_screen.dart';

class bigHomeScreen extends StatefulWidget {
  var IdKey;
  bigHomeScreen({this.IdKey});
  static String tag = '/homeScreen';

  @override
  _bigHomeScreenState createState() => _bigHomeScreenState();
}

class _bigHomeScreenState extends State<bigHomeScreen> {
  var currentIndex = 0;
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  var screens = [];
  List<IconData> listOfIcons = [];
  @override
  void initState() {
    listOfIcons = [
      Icons.home_rounded,
      Icons.category_rounded,
      Icons.newspaper_rounded,
      Icons.favorite_rounded,
      Icons.person_rounded,
    ];
    screens = [
      smallHomeScreen(
        idKey: widget.IdKey,
      ),
      categoriesScreen(),
      techNewsScreen(),
      myFavScreen(
        idKey: widget.IdKey,
      ),
      myAccountScreen(
        idKey: widget.IdKey,
      ),
    ];
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        /////////////////

        ////////////////////////////
        body: screens[selectedIndex],
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(20),
          height: size.width * .155,
          decoration: BoxDecoration(
            color: kProgressIndicator,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
            borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(
                  () {
                    currentIndex = index;
                    selectedIndex = index;
                  },
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : size.width * .029,
                      right: 8,
                      left: 8,
                    ),
                    width: size.width * .128,
                    height: index == currentIndex ? size.width * .014 : 0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color:
                        index == currentIndex ? Colors.white : Colors.black38,
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
