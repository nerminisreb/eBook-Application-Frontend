import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/consttants.dart';
import 'package:ebook/drawer_screens/aboutApp_screen.dart';
import 'package:ebook/firebase/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

class drawerScreen extends StatefulWidget {
  var idKey;
  drawerScreen({required this.idKey});
  @override
  State<drawerScreen> createState() => _drawerScreenState();
}

class _drawerScreenState extends State<drawerScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('/Accounts/${widget.idKey}/User/')
          .snapshots(),
      builder: ((context, snapshot) {
        print(widget.idKey);
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        List<DocumentSnapshot> s1 = snapshot.data!.docs;
        // '${(s1[0] as dynamic)['userName']}'

        return Drawer(
          width: 600,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: kProgressIndicator,
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (s1[0] as dynamic)['imageUrl'] != ''
                        ? CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                height: 110,
                                width: 110,
                                fit: BoxFit.cover,
                                imageUrl: (s1[0] as dynamic)['imageUrl'],
                                placeholder: (context, url) => Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    AnimatedOpacity(
                                      duration: Duration.zero,
                                      opacity: .5,
                                      child: Image.asset(
                                          'assets/images/signup.png'),
                                    ),
                                    CircularProgressIndicator(
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.red[200],
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  radius: 55,
                                  child: Icon(
                                    FontAwesomeIcons.user,
                                    size: 50,
                                    color: Colors.red[300],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${(s1[0] as dynamic)['userName']}',
                      style: GoogleFonts.breeSerif(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${(s1[0] as dynamic)['email']}',
                      style: GoogleFonts.breeSerif(
                        fontSize: 15,
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => aboutAppScreen(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'About Us  ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.help,
                    color: Colors.blue,
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
                      builder: (context) => aboutAppScreen(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Settigs  ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ),
                ),
              ),
              Divider(
                color: kProgressIndicator,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences s1 = await SharedPreferences.getInstance();
                  s1.setBool('fetch', false);
                  s1.setString('key', '');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: ((context) => AuthScreen())),
                  );
                },
                child: ListTile(
                  title: Text(
                    'Sign Out  :( ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                  ),
                ),
              ),
              Divider(
                color: kProgressIndicator,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 65, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 45, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
