import 'package:cryptocurrency_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List _currencies;

  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomePage(_currencies),
    );
  }
}

Future<List> getCurrencies() async {
  String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
