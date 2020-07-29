import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:keshuflutterapp/result.dart';
import 'home.dart';

class loadjson extends StatelessWidget {
  String langname;
  loadjson(this.langname);
  String assettoload;

   setasset()  {
    if (langname == "India") {
      return
      assettoload = "assests/India.json";
    } else if (langname == "Android") {
      return
      assettoload = "assests/Android.json";
    } else if (langname == "Water") {
      return
      assettoload = "assests/Water.json";
    } else if (langname == "WhatsApp") {
      return
      assettoload = "assests/whatsapp.json";
    } else {
      assettoload = "assests/Pubg.json";
    }
  }
  @override
  Widget build(BuildContext context) {
     setasset();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quizstar",
        ),
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
        builder: (context, snapshot){
          List mydata = json.decode(snapshot.data.toString());
          if(mydata == null){
            return Center(
              child: Text(
                  "Loading"),
            );
          }
          else
            {
             return quizpage(mydata: mydata);
            }
        },
      ),
    );
  }
}
class quizpage extends StatefulWidget {
  final mydata;
  quizpage({
    Key key, @required this.mydata
}) : super (key : key);
  @override
  _quizpageState createState() => _quizpageState(mydata : mydata);
}

class _quizpageState extends State<quizpage> {
  List mydata;
  _quizpageState({this.mydata});

  int i = 1;
  int marks = 0;
  int timer = 30;
  bool canceltimer = false;
  String showtimer = "30";
  Color colortoshow = Colors.cyanAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (i < 10) {
        i++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
         builder: (context) => resultpage(marks: marks),
       ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
    });
   starttimer();
  }

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }


  void checkanswer(String k){
    if(
    mydata [2][i.toString()] == mydata[1][i.toString()][k]){
     // answer is correct
      marks = marks + 5;
      colortoshow = right;
    }else{
colortoshow = wrong;
    }

    setState(() {
      canceltimer = true;
      btncolor[k] = colortoshow;
      Timer (Duration(seconds: 2), nextquestion);
    });
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return showDialog(context: context,
        builder: (context) => AlertDialog(
          title:  Text(
            "Quizstar",
          ),
          content: Text("You Can't Go Back At This Stage."),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Ok',
              ),
            )
          ],
        ),
        );
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()],
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: "Calibri",
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                   choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showtimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      );
  }
}
