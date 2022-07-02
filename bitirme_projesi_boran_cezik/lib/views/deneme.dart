import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
   List<String> denemeListe = [
    'TechCarrier',
    'Flutter',
    'Bootcamp',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Center(
          child: ListView.builder(
            itemCount: denemeListe.length,
            itemBuilder: (BuildContext context, int i) {
              return Column(children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 150,
                  child: Text(denemeListe?.elementAt(i) ?? ""),
                ),
                SizedBox(height: 6,)
              ]);
            }
          )
        ));
  }
}
