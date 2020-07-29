import 'package:flutter/material.dart';
import 'package:keshuflutterapp/splash.dart';

void main(){
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz Star",
      theme:  ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: splashscreen(),
    );
  }
}

