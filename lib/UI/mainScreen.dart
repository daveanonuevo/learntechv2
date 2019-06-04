import 'package:flutter/material.dart';
import 'package:learntech/UI/sidebar.dart';
import 'package:learntech/WhatsApp/topicSelect.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/wallpaper.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        drawer: SideBar(),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TopicSelect(selectedTopic: "WhatsApp"))),
                    child: Container(
                      height: 230,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      alignment: Alignment.topCenter,
                      child: Column(children: <Widget>[
                        Container(
                            height: 170,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0)),
                              //borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            ),
                            alignment: Alignment.topCenter,
                            child: Column(children: <Widget>[
                              Container(
                                  height: 120,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/logo/WhatsApp.png")))),
                              Text(
                                "Whatsapp Guides",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              )
                            ])),
                        Text(
                          "Fast, Simple & Secure Messaging and Calling for Free",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                          textAlign: TextAlign.center,
                        )
                      ]),
                    )),
                GestureDetector(
                  onTap: () {
                    debugPrint("Red Pressed");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TopicSelect(selectedTopic: "SecurityTips")));
                  },
//                      Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => TopicSelect(selectedTopic: "SecurityTips") ) ),
                  child: Container(
                      height: 230,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 170,
                              width: 350,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.red.shade900,
                                        Colors.blue.shade400
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0))),
                              alignment: Alignment.topCenter,
                              child: Column(children: <Widget>[
                                Container(
                                    height: 120,
                                    width: 350,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                        "assets/logo/lock.png",
                                      ),
                                    ))),
                                Text(
                                  "Safety Online Tips",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )
                              ])),
                          Text(
                            "Tips to Remain Safe in the Internet World",
                            style: TextStyle(color: Colors.black, fontSize: 22),
                            textAlign: TextAlign.center,
                          ),

                        ],
                      )),
                ),
              ]),
        ),
      ),
    );
  }
}
