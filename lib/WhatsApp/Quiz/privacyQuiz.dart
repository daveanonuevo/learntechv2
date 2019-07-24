import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learntech/UI/SideBar/contactUs.dart';
import 'package:learntech/WhatsApp/displayTopic.dart';
import 'package:learntech/WhatsApp/topicList.dart';
import 'package:learntech/localizations.dart';

class PrivacyQuiz extends StatefulWidget {
  @override
  _PrivacyQuizState createState() => _PrivacyQuizState();
}

class _PrivacyQuizState extends State<PrivacyQuiz> {
  int radioValue;
  int attemptCounter = 0;
  String url = "https://us-central1-learntech-d9387.cloudfunctions.net/widgets/attempts/";

  void _radioButton(int value) {
    setState(() {
      radioValue = value;
    });
  }

  void _clearAnswer() {
    setState(() {
      radioValue = null;
    });
  }

  void _checkAnswer() {
    if (radioValue == 2) {
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(AppLocalizations().safeTitle2Category3QuizReturnTrans1, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30.0),),
            content: Text(
              AppLocalizations().safeTitle2Category3QuizReturnTrans11,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  AppLocalizations().safeTitle2Category3QuizReturnTrans3,
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                 onPressed:() {
                  String jsonMap = jsonEncode({
                    'attempts': attemptCounter,
                    'question': '${AppLocalizations().safeTitle2Category3QuizReturnTrans12}'
                  });
                  apiRequest(url, jsonMap); //Sends jsonMap to url
                   Navigator.push(
                     context, MaterialPageRoute(
                       builder: (context) => (
                       DisplayTopic(
                         topic: ModuleTopic.loadTopics(
                             "Security Tips")[1],
                         module: "Security Tips",
                         count: 1,
                       )
                       ),
                     ),
                   );
                 }
              ),
              RaisedButton(
                child: Text(
                  AppLocalizations().safeTitle2Category3QuizReturnTrans4,
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                onPressed:() {
                  Navigator.of(context).pop();
                },
              ), 
            ],
          );
        }
      );
    } else if ((radioValue == 3) || (radioValue == 1)) { //Wrong Answer
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(AppLocalizations().safeTitle2Category3QuizReturnTrans7, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30.0),),
            content: Text(
              AppLocalizations().safeTitle2Category3QuizReturnTrans8,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                onPressed:() {
                  Navigator.of(context).pop();
                },
              ), 
            ],
          );
        }
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(AppLocalizations().safeTitle2Category3QuizReturnTrans9, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30.0),),
            content: Text(
              AppLocalizations().safeTitle2Category3QuizReturnTrans10,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                onPressed:() {
                  Navigator.of(context).pop();
                },
              ), 
            ],
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 40.0),
              onPressed: () => Navigator.pop(context, false),
            ),
            backgroundColor: Colors.white,
            title: Text(
              AppLocalizations().safeTitle2Category3QuizReturnTrans12,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            )),
        body: Column(children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              AppLocalizations().safeTitle2Category3QuizReturnTrans13,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
          ),
          Divider(height: 5.0, color: Colors.black),
          Column(
            children: <Widget>[
              RadioListTile(
                  title: Text(
                    AppLocalizations().safeTitle2Category3QuizReturnTrans14,
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  groupValue: radioValue,
                  value: 1,
                  onChanged: _radioButton),
              Divider(height: 5.0, color: Colors.black),
              RadioListTile(
                  title: Text(
                    AppLocalizations().safeTitle2Category3QuizReturnTrans15,
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  groupValue: radioValue,
                  value: 2,
                  onChanged: _radioButton),
              Divider(height: 5.0, color: Colors.black),
              RadioListTile(
                  title: Text(
                    AppLocalizations().safeTitle2Category3QuizReturnTrans16,
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  groupValue: radioValue,
                  value: 3,
                  onChanged: _radioButton),
              Divider(height: 5.0, color: Colors.black),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15),
          ),
          ButtonTheme(
            minWidth: 200.0,
            height: 70,
            child: RaisedButton(
              color: Colors.white30,
              child: Text(
                AppLocalizations().safeTitle2Category3QuizTrans4,
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              onPressed: () {
                attemptCounter++;
                _checkAnswer();
                _clearAnswer();
              }
            ),
          )
        ]));
  }
}
