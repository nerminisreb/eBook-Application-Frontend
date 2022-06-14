/* import 'package:ebook/consttants.dart';
import 'package:flutter/material.dart';

class word extends StatefulWidget {
  word({Key? key}) : super(key: key);

  @override
  State<word> createState() => _wordState();
}

class _wordState extends State<word> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                onTap: () {},
                child: Text(
                  "See More  ",
                  style: TextStyle(
                    color: kLightBlackColor,
                  ),
                ),
              ),
            ],
          ),
        ],

      ),
    );
  }
}
 */