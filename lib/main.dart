import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surf/view/LoginScreen.dart';

void main() {
  runApp(MaterialApp(
    title: "Surf",
    debugShowCheckedModeBanner: false,
    home: new Scaffold(
      body: LoginScreen(),
    ),
  ));
}
