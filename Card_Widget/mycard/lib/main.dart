import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mycard/cardscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.5),
      body: CardScreen(),
    ),
  ));
}
