import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/button.dart';
import 'package:ebook/consttants.dart';
import 'package:ebook/firebase/auth.dart';
import 'package:ebook/screens/bigHome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}




enum AuthMode {
  SignUp,
  Login,
}




class _AuthScreenState extends State<AuthScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode authMode = AuthMode.SignUp;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'userName': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          authMode == AuthMode.SignUp ? "Sign Up  " : 'Log In',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: kProgressIndicator,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    if (authMode == AuthMode.SignUp)
                      TextFormField(
                        onSaved: (val) {
                          _authData['userName'] = val as String;
                        },
                        validator: (val) {
                          if (val!.length > 100) {
                            return "username cant to be larger than 100 letter";
                          }
                          if (val.length < 2) {
                            return "username cant to be less than 2 letter";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          hintText: 'Enter Your username ',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 10,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                    TextFormField(
                      onSaved: (val) {
                        _authData['email'] = val as String;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "email cant to be larger than 100 letter";
                        }
                        if (val.length < 2) {
                          return "email cant to be less than 2 letter";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter Your Email ',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onSaved: (val) {
                        _authData['password'] = val as String;
                      },
                      validator: (val) {
                        if (val!.length > 100) {
                          return "password cant to be larger than 100 letter";
                        }
                        if (val.length < 4) {
                          return "password cant to be less than 4 letter";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        hintText: 'Enter Your Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(authMode == AuthMode.SignUp
                              ? "if you have account "
                              : 'Create new account'),
                          InkWell(
                            onTap: () {
                              setState(() {
                                authMode == AuthMode.Login
                                    ? authMode = AuthMode.SignUp
                                    : authMode = AuthMode.Login;
                              });
                            },
                            child: Text(
                              "click Here",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: MyButton(
                        color: kProgressIndicator,
                        title:
                            authMode == AuthMode.SignUp ? "Sign Up " : 'Log In',
                        onPressed: _submit,
                      ),
                    ),
                  ],
                )),
          ),
        ],
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

    SharedPreferences s1 = await SharedPreferences.getInstance();
    try {
      if (authMode == AuthMode.Login) {
        Auth _auth = Auth();

        var x = _auth.loginWithEmailAndPassword(
            _authData['email'] as String, _authData['password'] as String);

        x.then((value) {
          print(value.user!.uid);
          s1.setString('idKey', value.user!.uid);
          s1.setBool('fetch', true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => bigHomeScreen(
                    IdKey: value.user!.uid,
                  )),
            ),
          );
        });
      } else {
        Auth auth = Auth();
        var x = auth.signup(
            _authData['email'] as String, _authData['password'] as String);

        x.then((value) {
          print(value.user!.uid);
          userSetup(
            value.user!.uid,
            _authData['email'] as String,
            _authData['password'] as String,
            _authData['userName'] as String,
          );
          s1.setString('idKey', value.user!.uid);
          s1.setBool('fetch', true);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: ((context) => bigHomeScreen(
                    IdKey: value.user!.uid,
                  )),
            ),
          );
        });
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
        ..show();
    }
  }
}
