import 'package:ebook/consttants.dart';
import 'package:ebook/database/infData.dart';
import 'package:ebook/screens_to_call/details_screen.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  int id;
  var idKey;
  BookCard({
    required this.id,
    required this.idKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      height: 140,
      width: 140,
      child: Stack(
        children: <Widget>[
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 10,
                  color: kShadowColor.withOpacity(.50),
                ),
              ],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: ExactAssetImage('${book[id]['image']}'),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 0,
            child: Column(
              children: <Widget>[],
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              padding: EdgeInsets.only(left: 8),
              alignment: AlignmentDirectional.topStart,
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(
                    '${book[id]['title']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  /* Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.only(top: 0),
                    ),
                  ), */
                  Text(
                    "'${book[id]['subtitle']}'",
                    style: TextStyle(
                      fontSize: 8,
                      color: kLightBlackColor,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child: InkWell(
                          hoverColor: kBlackColor,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detailsScreen(
                                  idKey: idKey,
                                  id: id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 75,
                            padding: EdgeInsets.symmetric(vertical: 6),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              " Details",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: kBlackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
