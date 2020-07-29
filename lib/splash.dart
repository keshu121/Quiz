import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:keshuflutterapp/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override

   void initState(){
    super.initState();
     Timer(Duration(seconds: 4), (){
       Navigator.pushReplacement(context, MaterialPageRoute(
         builder: (context) => homepage(),
       ),
       );
     }
     );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Text(
      "Powdered by Keshu Inc",
        style: TextStyle(
          fontSize: 15.0,
        ),
        textAlign: TextAlign.right,
      ),
      backgroundColor: Colors.cyan,
      body: Center(
        child: Text(
          "Quizstar\n Test Yourself",
          style: TextStyle(
            fontSize: 60.0,
            color: Colors.white,
            fontFamily: "Cursive",
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
