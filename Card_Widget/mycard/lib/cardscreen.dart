import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(

        elevation: 5,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.yellow,
            width: 1,
          ),
        ),
        child: Container(
          width: 400,
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.indigo,
            Colors.purpleAccent,
            Colors.blue,
          ])),
          child: Center(child: Text("Card Widgets")),
        ),
      ),
    );
  }
}
