import 'package:flutter/material.dart';
import 'package:keshuflutterapp/quizpage.dart';
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
   List<String> langname = [
     "India",
     "Android",
     "Water",
     "WhatsApp",
     "PUBG",
   ];

   List<String> images = [
     'assests/images/india.jpg',
     'assests/images/Android.png',
     'assests/images/water.jpg',
     'assests/images/whatsapp.jpg',
     'assests/images/download.jpg',

   ];
   List<String> des = [
     "Incredible India! \nTest your knowledge related to some interesting facts about INDIA.",
     "Android, the most popular OS in mobile devices. \nTest your knowledge about Android.",
     "The most essential fluid to drink everyday! \nTest your knowledge about water.",
     "The 3rd most downloaded app in the world is Whatsapp. \nTest your knowledge about Whatsapp.",
     "PUBG quiz for the PUBG lovers!",
   ];

  Widget customcard(String langname, String images, String des){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0,
      horizontal: 10.0),
      child: InkWell(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => loadjson(langname),
          ));
        },
        child :Material(
          color: Colors.white70,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius:BorderRadius.circular(75.0),
                    child: Container(
                      width: 150.0,
                      height: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            images,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontFamily: "Cursive",
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                  des,
                    style: TextStyle(
                      fontFamily: "Times new roman",
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Quizstar",
        style: TextStyle(
          fontSize: 20.0,
              color: Colors.white,
        ) ,
          ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          customcard(langname[0],images[0], des [0]),
          customcard(langname[1], images[1],des[1]),
          customcard(langname[2],images[2],des[2]),
          customcard(langname[3],images[3],des[3]),
          customcard(langname[4],images[4],des[4]),
        ],
      ),
    );
  }
}
