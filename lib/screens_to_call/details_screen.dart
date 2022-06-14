import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/database/infData.dart';
import 'package:flutter/material.dart';
import 'package:ebook/screens/bigHome_screen.dart';

import 'package:ebook/consttants.dart';

class detailsScreen extends StatefulWidget {
  int id;
  var idKey;
  detailsScreen({
    required this.id,
    required this.idKey,
  });
  @override
  State<detailsScreen> createState() => _detailsScreenState();
}

class _detailsScreenState extends State<detailsScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('/Accounts/${widget.idKey}/favorite/')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<DocumentSnapshot> s1 = snapshot.data!.docs;
        return Column(
          children: <Widget>[
            Flexible(
              child: Scaffold(
                // ////// APPBAAAAARRRRRR INFOOOOO
                appBar: AppBar(
                  backgroundColor: kProgressIndicator,
                  elevation: 0,
                  title: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => bigHomeScreen(),
                        ),
                      );
                    },
                    child: Text(" eBook ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  actions: <Widget>[
                    //البوتونات اللي بالاب بار
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),

                body: ListView(
                  children: <Widget>[
                    Container(
                      height: 300,
                      child: GridTile(
                        child: Container(
                          ////// PICTUREEEE INFOOOOOOO
                          color: Colors.white,
                          child: Image.asset(
                              '${book[widget.id]['image']}'), ////////////////////
                        ),
                        footer: Container(
                          /////////////// اسم المنتج و السعر القديم والجديد//////
                          color: Colors.white70,
                          child: ListTile(
                            leading: Text(
                              '${book[widget.id]['title']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    "${book[widget.id]['subtitle']}",
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    /////////  اول بوتون   ////////
                    Row(
                      children: <Widget>[
                        /////////  البوتون تبع المقاس ////////

                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    ////////القائمة اللي بتطلع عند القياس /////
                                    return AlertDialog(
                                      title: Text(" Size "),
                                      content: Text("Choose the Size "),
                                      actions: <Widget>[
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(context);
                                          },
                                          child: Text("close "),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: Colors.white,
                            textColor: Colors.grey,
                            elevation: 0.2,
                            child: Row(
                              children: const <Widget>[
                                Expanded(
                                  child: Text("Size "),
                                ),
                                Expanded(
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /////////البوتون تبع الكمية  /////////
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    ////////القائمة اللي بتطلع عند الكمية///////
                                    return AlertDialog(
                                      title: Text("Quantity "),
                                      content: Text("Choose the quantity "),
                                      actions: <Widget>[
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(context);
                                          },
                                          child: Text("close "),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            color: Colors.white,
                            textColor: Colors.grey,
                            elevation: 0.2,
                            child: Row(
                              children: const <Widget>[
                                Expanded(
                                  child: Text("Count "),
                                ),
                                Expanded(
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    /////////  اخر  بوتون   ////////
                    Center(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              setState(() {
                                if (s1[widget.id]['id'] !=
                                    widget.id.toString()) {
                                  FirebaseFirestore.instance
                                      .collection('Accounts')
                                      .doc('${widget.idKey}')
                                      .collection('favorite')
                                      .doc('${widget.id}')
                                      .set({'id': '${widget.id}'});
                                } else {
                                  FirebaseFirestore.instance
                                      .collection('Accounts')
                                      .doc('${widget.idKey}')
                                      .collection('favorite')
                                      .doc('${widget.id}')
                                      .set({'id': ''});
                                }
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              size: 40,
                              color: s1[widget.id]['id'] == widget.id.toString()
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AnimatedOpacity(
                            opacity: (s1[widget.id] as dynamic)['id'] ==
                                    widget.id.toString()
                                ? 0
                                : 1,
                            duration: Duration(milliseconds: 300),
                            child: Text(
                              'Add to favorite',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(0, -15),
                            child: AnimatedOpacity(
                              opacity: (s1[widget.id] as dynamic)['id'] ==
                                      widget.id.toString()
                                  ? 1
                                  : 0,
                              duration: Duration(milliseconds: 300),
                              child: Text(
                                'Added',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    ListTile(
                      /////تفاصيل المنتج //////////
                      title: Text("Product details "),
                      subtitle: Text(
                          " and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. "),
                    ),

                    Divider(),
                    Row(
                      ///////////اسم المنتج ///////
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                          child: Text(
                            "Product Name ",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('dddddffff'),
                        ),
                      ],
                    ),
                    Row(
                      ///////////ماركة المنتج//////
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                          child: Text(
                            "product Author ",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Brand x "),
                        ),
                      ],
                    ),
                    Row(
                      ///////////حالة المنتج ////////
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                          child: Text(
                            "product condition ",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text("NEW"),
                        ),
                      ],
                    ),

                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
