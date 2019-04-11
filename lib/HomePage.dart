import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;

  HomePage(this.currencies);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MaterialColor> _colors = [Colors.blue, Colors.red, Colors.indigo];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CryptoCurrencies"),
      ),
      body: cryptoWidget(),
    );
  }

  Widget cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
                  itemCount: widget.currencies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Map currency = widget.currencies[index];
                    final MaterialColor color = _colors[index % _colors.length];
                    return _getListUi(currency, color);
                  })),
        ],
      ),
    );
  }

  ListTile _getListUi(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0],style: TextStyle(color: Colors.white),),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle:
          _getSubtitle(currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitle(String priceUsd, String percentChange) {
    TextSpan priceTextWidget =
        TextSpan(text: "\$$priceUsd\n", style: TextStyle(color: Colors.black));
    String percentChangeText = "1 Hour: $percentChange";
    TextSpan percentChangeSpan;
    if (double.parse(percentChange) > 0) {
      percentChangeSpan = TextSpan(
          text: percentChangeText, style: TextStyle(color: Colors.green));
    } else {
      percentChangeSpan = TextSpan(
          text: percentChangeText, style: TextStyle(color: Colors.red));
    }
    return RichText(
      text: TextSpan(children: [priceTextWidget, percentChangeSpan]),
    );
  }
}
