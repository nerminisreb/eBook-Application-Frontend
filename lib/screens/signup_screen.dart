/* import 'package:ebook/firebase/auth.dart';
import 'package:ebook/firebase/fetch.dart';
import 'package:ebook/screens/account.dart';
import 'package:ebook/screens/bigHome_screen.dart';
import 'package:ebook/screens/login_screen.dart';
import 'package:ebook/screens/signup_screen.dart';
import 'package:ebook/screens/welcome_screen.dart';
import 'package:ebook/screens_to_call/book.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ebook/consttants.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final _auth = FirebaseAuth.instanceFor;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wall.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Create account now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                  fontSize: 30,
                ),
              ),
              Image.asset(
                "assets/images/signup.png",
                width: 250,
                height: 250,
              ),
              Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                ),
              ),
              /* Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  width: 350,
                  height: 50,
                  child: TextField(




                    

                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: kProgressIndicator,
                      ),
                      hintText: "User Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ), */
              Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                ),
              ),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  width: 350,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: kProgressIndicator,
                      ),
                      hintText: "Your Email",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                ),
              ),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  width: 350,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: kProgressIndicator,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: kProgressIndicator,
                      ),
                      hintText: "Password",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                ),
              ),
              Material(
                color: kProgressIndicator,
                borderRadius: BorderRadius.circular(35),
                child: InkWell(
                  hoverColor: kBlackColor,
                  onTap: () async {
                    Authendication auth = Authendication();

                    try {
                      var a = await auth.signup(email, password);
                      a;
                      print('===============  ${a.user!.uid}');
                      print('made account ');
                      userSetup(email, password, a.user!.uid);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => bigHomeScreen(
                              //  IdKey: x[0].Id,
                              )),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                    ////
                    /////
                    ////
                    ////
                    ////
                    ///
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 230,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 15),
                          blurRadius: 20,
                          color: Color(0xFF666666).withOpacity(.11),
                        )
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text("Already have an account?"),
                  Container(
                    margin: EdgeInsets.only(left: 6),
                    child: GestureDetector(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const loginScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */