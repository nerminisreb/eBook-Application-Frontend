import 'package:ebook/bottom_bar_screen/categories_screen.dart';
import 'package:ebook/bottom_bar_screen/myAccount_screen.dart';
import 'package:ebook/bottom_bar_screen/myFav_screen.dart';
import 'package:ebook/bottom_bar_screen/shop_screen.dart';
import 'package:ebook/bottom_bar_screen/smallHome_screen.dart';
import 'package:ebook/consttants.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Bottom Navigation Bar',
//       home: bottomBar(),
//     ),
//   );
// }

class bottomBar extends StatefulWidget {
  var IdKey;
  bottomBar({required this.IdKey});
  @override
  bottomBarState createState() => bottomBarState();
}

class bottomBarState extends State<bottomBar> {
  var currentIndex = 0;

  var screens = [];
  List<IconData> listOfIcons = [];
  @override
  void initState() {
    screens = [
      smallHomeScreen(
        idKey: widget.IdKey,
      ),
      categoriesScreen(),
      shopScreen(),
      myFavScreen(
        idKey: widget.IdKey,
      ),
      myAccountScreen(),
    ];
    listOfIcons = [
      Icons.home_rounded,
      Icons.category_rounded,
      Icons.shopping_bag_rounded,
      Icons.favorite_rounded,
      Icons.person_rounded,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: size.width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
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
                    right: size.width * .0422,
                    left: size.width * .0422,
                  ),
                  width: size.width * .128,
                  height: index == currentIndex ? size.width * .014 : 0,
                  decoration: BoxDecoration(
                    color: kProgressIndicator,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
                Icon(
                  listOfIcons[index],
                  size: size.width * .076,
                  color: index == currentIndex
                      ? kProgressIndicator
                      : Colors.black38,
                ),
                SizedBox(height: size.width * .03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
