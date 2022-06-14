import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Inf.dart';

Future<dynamic> getInfByApi() async {
  getInf = [];
  const String apiKey = '8b5c48042a504d86a67658b0676775b6';
  http.Response res = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=technology&apiKey=${apiKey}'),
  );
  
  var data = json.decode(res.body);
  for (var item in data['articles']) {
    getInf.add(Inf.fromJson(item));
  }
  print('================== ${getInf[2].urlToImage}');
  print(getInf[0].title);

  return getInf;
}
