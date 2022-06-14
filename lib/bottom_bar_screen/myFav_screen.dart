import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/consttants.dart';
import 'package:ebook/database/infData.dart';
import 'package:ebook/screens_to_call/book.dart';
import 'package:ebook/screens_to_call/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class myFavScreen extends StatefulWidget {
  var idKey;
  myFavScreen({required this.idKey});
  @override
  State<myFavScreen> createState() => _myFavScreenState();
}

class _myFavScreenState extends State<myFavScreen> {
  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kProgressIndicator,
          elevation: 0,
          title: Text('Favorite'),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('/Accounts/${widget.idKey}/favorite')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Transform.translate(
                  offset: Offset(0, -130),
                  child: Text(
                    'Error 404',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }
            var newItem = [];
            var s2 = snapshot.data!.docs;

            for (int i = 0; i < s2.length; i++) {
              if (s2[i]['id'] != '') {
                newItem.add(s2[i]['id']);
              }
            }
            if (newItem.isEmpty) {
              return Center(
                child: Transform.translate(
                  offset: Offset(0, -130),
                  child: Text(
                    'No Items',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }
            print('========== ${newItem}');
            return ListView.builder(
              itemCount: newItem.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => detailsScreen(
                            id: int.parse(newItem[index]),
                            idKey: widget.idKey,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.brown[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.asset(
                                      book[int.parse(newItem[index])]['image']
                                          as String,
                                      width: 150,
                                      height: 150,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 200,
                                          child: Text(
                                            '${book[int.parse(newItem[index])]['title']}',
                                            style: GoogleFonts.oswald(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text(
                                            '${book[int.parse(newItem[index])]['subtitle']}', ////
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ));
  }
}
