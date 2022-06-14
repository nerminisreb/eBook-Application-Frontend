/* import 'package:flutter/material.dart';


import 'package:ebook/firebase/auth.dart';
import 'package:ebook/screens/bigHome_screen.dart';
import 'package:ebook/consttants.dart';



import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';




class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  



 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode authMode = AuthMode.SignUp;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'userName': '',
  };




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
            children: <Widget>[
              Text(
                "Login now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                  fontSize: 30,
                ),
              ),
              Image.asset(
                "assets/images/login.png",
                width: 250,
                height: 250,
              ),
              Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                ),
              ),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
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
                  padding: EdgeInsets.only(top: 15, left: 20),
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
                  padding: EdgeInsets.only(top: 30),
                ),
              ),
              Material(
                color: kProgressIndicator,
                borderRadius: BorderRadius.circular(35),
                child: InkWell(
                  hoverColor: kLightBlackColor,
                  onTap: () async {
                    Authendication _auth = Authendication();

                    try {
                      await _auth.loginWithEmailAndPassword(email, password);
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

                    /////
                    ////
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
                    child: const Text("Log in",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      return;
    } else {
      FocusScope.of(context).unfocus();
      _formKey.currentState!.save();
    }

    // setState(() {
    //   isLoading = true;
    // });
    SharedPreferences s1 = await SharedPreferences.getInstance();
    try {
      if (authMode == AuthMode.Login) {
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'] as String,
          _authData['password'] as String,
        );

        var x = Provider.of<Auth>(context, listen: false).addNewUser;
        print('================== ${x[0].Id}');

        ////////////////////////
        s1.setString('key', '${x[0].Id}');
        s1.setBool('fetch', true);
        /////////////////////
        ///
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => bigHomeScreen(
               //   IdKey: x[0].Id,
                )),
          ),
        );
      } else {
        await Provider.of<Auth>(context, listen: false).signUp(
          _authData['email'] as String,
          _authData['password'] as String,
        );
        var x = Provider.of<Auth>(context, listen: false).addNewUser;
        print('================== ${x[0].Id}');

        ////////////////
        ////////////////////////////////////
        ///////////
        s1.setString('key', '${x[0].Id}');
        s1.setBool('fetch', true);
        ///////////////////////
        //////////
        ///

        ///
        ////

        ///
        ///

        await FirebaseFirestore.instance
            .collection('Users')
            .doc('${x[0].Id}')
            .collection('userInf')
            .add({
          'userName': _authData['userName'],
          'email': _authData['email']!,
          'password': _authData['password']!,
        });
        ////
        ////
        ///
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => bigHomeScreen(
                 // IdKey: x[0].Id,
                )),
          ),
        );
      }
    } catch (error) {
      // setState(() {
      //   isLoading = false;
      // });
      var errorMessage = 'Authentication Faild';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      AwesomeDialog(
          context: context,
          title: "Error",
          body: Text("${errorMessage}", style: TextStyle(fontSize: 15)))
        .show();
    }
  }
}
enum AuthMode {
  SignUp,
  Login,
}
 */