import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CryptoCurrencies"),
      ),
      body: cryptoWidget(),
    );
  }
  Widget cryptoWidget(){
    return Container(
      child: Flexible(child: ListView.builder(itemBuilder: (BuildContext context,int index){
        
      })),
    );
  }
}
