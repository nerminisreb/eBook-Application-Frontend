import 'package:ebook/firebase/auth.dart';
import 'package:ebook/firebase/auth_screen.dart';
import 'package:ebook/screens/bigHome_screen.dart';
import 'package:ebook/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

var islogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences a1 = await SharedPreferences.getInstance();
  var idKey = a1.getString('idKey');
  var fetch = a1.getBool('fetch') == null ? false : a1.getBool('fetch');
  runApp(ebook(IdKey: idKey, fetch: fetch));
}

class ebook extends StatefulWidget {
  var IdKey;
  var fetch;
  ebook({required this.IdKey, required this.fetch});

  @override
  State<ebook> createState() => _ebookState();
}

class _ebookState extends State<ebook> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Auth>(
            create: ((context) => Auth()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.blue,
          ),
          home: this.widget.fetch == false
              ? welcomeScreen()
              : bigHomeScreen(
                  IdKey: this.widget.IdKey,
                ),
          routes: {},
          // initialRoute: 'login',
        ));
  }
}
