import 'package:flutter/material.dart';
import 'package:learntech/UI/sidebar.dart';
import 'package:learntech/WhatsApp/topicSelect.dart';
//import 'package:learntech/WhatsApp/topicSelectTest.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/Background/wallpaper.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        drawer: SideBar(),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 35),
          child: Center(
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
//                                  TopicSelect2(selectedTopic: "WhatsApp"))),
                      child: Container(
//                      Total Container
                        height: queryData.size.height / 32 * 11,
                        width: queryData.size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        alignment: Alignment.topCenter,
                        child: Column(children: <Widget>[
                          Container(
//                          Green Part
                              height: queryData.size.height / 32 * 8,
                              decoration: BoxDecoration(
//                              Green Part
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                                //borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              ),
                              alignment: Alignment.topCenter,
                              child: Column(children: <Widget>[
                                Container(
//                                image placeholder
                                    height: queryData.size.height / 32 * 6,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Logo/WhatsApp.png")))),
                                Text(
//                                Title Text
                                  "WhatsApp Guides",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                )
                              ])),
                          Text(
//                          White Text
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
//                                  TopicSelect2(selectedTopic: "SecurityTips")));
                    },
//                      Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => TopicSelect(selectedTopic: "SecurityTips") ) ),
                    child: Container(
                        height: queryData.size.height / 32 * 11,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: queryData.size.height / 32 * 8,
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
                                      height: queryData.size.height / 32 * 6,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                          "assets/Logo/lock.png",
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
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
