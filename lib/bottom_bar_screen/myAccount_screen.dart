import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/consttants.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class myAccountScreen extends StatefulWidget {
  var idKey;
  myAccountScreen({this.idKey});
  @override
  State<myAccountScreen> createState() => _myAccountScreenState();
}

class _myAccountScreenState extends State<myAccountScreen> {
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  fetchImage() async {
    final image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 60);
    if (image == null) {
      return;
    }

    setState(() {
      pickedImage = File(image.path);
    });
    Random x = new Random();
    final ref = FirebaseStorage.instance
        .ref()
        .child('user_image')
        .child('${widget.idKey}${x.nextInt(100)}.jpg');

    ///
    ////
    var urlImage;
    if (pickedImage != null) {
      await ref.putFile(pickedImage!);
      urlImage = await ref.getDownloadURL();
      await ref.putFile(pickedImage!);
    } else {
      urlImage =
          'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png';
    }
    await FirebaseFirestore.instance
        .collection('Accounts')
        .doc('${widget.idKey}')
        .collection('User')
        .doc('Inf')
        .update({
      'imageUrl': urlImage,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: kProgressIndicator,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('/Accounts/${widget.idKey}/User/')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<DocumentSnapshot> s1 = snapshot.data!.docs;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: GoogleFonts.carterOne(
                      fontSize: 45,
                      color: Colors.black,
                    ),
                    child: Transform.translate(
                      offset: Offset(0, -30),
                      child: Column(
                        children: [
                          Text('My'),
                          Text('Profile'),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -30),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Transform.translate(
                          offset: Offset(0, 75),
                          child: Container(
                            width: 400,
                            height: 300,
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kProgressIndicator,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 130, left: 20, right: 20),
                              child: Column(
                                children: [
                                  Card(
                                    color: Colors.white,
                                    child: ListTile(
                                      leading: Icon(FontAwesomeIcons.user),
                                      title: Text(
                                        '${s1[0]['userName']}',
                                        style: GoogleFonts.roboto(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    color: Colors.white,
                                    child: ListTile(
                                      leading: Icon(FontAwesomeIcons.at),
                                      title: Text(
                                        '${s1[0]['email']}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: fetchImage,
                          child: (s1[0] as dynamic)['imageUrl'] == ''
                              ? CircleAvatar(
                                  radius: 100,
                                  backgroundColor: Colors.red[200],
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.grey[200],
                                        radius: 90,
                                        child: Icon(
                                          FontAwesomeIcons.user,
                                          size: 70,
                                          color: Colors.red[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 100,
                                  backgroundColor: Colors.cyan[200],
                                  child: FutureBuilder(
                                    future: Future.delayed(
                                      Duration(seconds: 1),
                                    ),
                                    builder: (context, snapshot) {
                                      return AnimatedOpacity(
                                        duration: Duration(milliseconds: 200),
                                        opacity: snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? .4
                                            : 1,
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(110)),
                                              child: CachedNetworkImage(
                                                height: 190,
                                                width: 190,
                                                fit: BoxFit.cover,
                                                imageUrl: s1[0]['imageUrl'],
                                                placeholder: (context, url) =>
                                                    Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    AnimatedOpacity(
                                                      duration: Duration.zero,
                                                      opacity: .5,
                                                      child: Image.asset(
                                                        'assets/images/signup.png',
                                                      ),
                                                    ),
                                                    CircularProgressIndicator(
                                                      color: Colors.blue,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
