/* import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ebook/weather/HAVA.dart';
import 'package:http/http.dart' as http;

class hava extends StatefulWidget {
  const hava({Key? key}) : super(key: key);

  @override
  State<hava> createState() => _havaState();
}

class _havaState extends State<hava> {
  @override
  void initState() {
    getCurrentWeather();
    super.initState();
  }

  Weather? get _hava => null;

  get http => null;

  set hava(Object? hava) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: FutureBuilder(
            future: getCurrentWeather(),
            builder: (context, snapshot) {
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    getCurrentWeather();
                  });
                },
                child: !getInf.isEmpty
                    ? ListView(
                        children: [weatherBox()],
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              );
            }),
      ),

      //  Center(
      //   child: FutureBuilder(
      //     builder: (context, snapshot) {
      //       if (snapshot != null) {
      //         this.hava = snapshot.data;
      //         if (this._hava == null) {
      //           return Text("Error getting weather");
      //         } else {
      //           return weatherBox(_hava!);
      //         }
      //       } else {
      //         return CircularProgressIndicator();
      //       }
      //     },
      //     future: getCurrentWeather(),
      //   ),
      // ),
    );
  }

  Widget weatherBox() {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
          margin: const EdgeInsets.all(10.0),
          child: Text(
            "${getInf[0].temp}°C",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
          )),
      Container(
          margin: const EdgeInsets.all(5.0),
          child: Text("${getInf[0].description}")),
      Container(
          margin: const EdgeInsets.all(5.0),
          child: Text("Feels:${getInf[0].feelsLike}°C")),
      Container(
          margin: const EdgeInsets.all(5.0),
          child: Text("H:${getInf[0].high}°C L:${getInf[0].low}°C")),
    ]);
  }
}

Future getCurrentWeather() async {
  String city = "ankara";
  String apiKey = "1d34f926265b58a505fcdf8a5d60b5b1";
  var url =
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey";

  http.Response res = await http.get(Uri.parse(url));

  var data = json.decode(res.body);

  getInf.add(Weather.fromJson(data));

  print('===================== ${getInf[0].temp}');
  return getInf;
}
 */

import 'package:flutter/material.dart';

class hava extends StatefulWidget {
  hava({Key? key}) : super(key: key);

  @override
  State<hava> createState() => _havaState();
}

class _havaState extends State<hava> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}