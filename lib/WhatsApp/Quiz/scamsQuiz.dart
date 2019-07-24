import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learntech/requests/api.dart';
import 'package:learntech/localizations.dart';

import '../displayTopic.dart';
import '../topicList.dart';

class ScamsQuiz extends StatefulWidget {
  @override
  _ScamsQuizState createState() => _ScamsQuizState();
}

class _ScamsQuizState extends State<ScamsQuiz> {
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;
  bool checkBoxValue3 = false;
  int attemptCounter = 0;
  String url = "https://us-central1-learntech-d9387.cloudfunctions.net/widgets/attempts/";

  void _clearAnswer() {
    setState(() {
      checkBoxValue1 = false;
      checkBoxValue2 = false;
      checkBoxValue3 = false;
    });
  }

  void _value1Changed(bool value) => setState(() => checkBoxValue1 = value);
  void _value2Changed(bool value) => setState(() => checkBoxValue2 = value);
  void _value3Changed(bool value) => setState(() => checkBoxValue3 = value);

  void _checkAnswer() {
    if ((checkBoxValue1 == true) && (checkBoxValue2 == true) && (checkBoxValue3 == true)) {
      String jsonMap = jsonEncode({
        'attempts': attemptCounter,
        'question': '${AppLocalizations().safeTitle2Category3QuizReturnTrans17}'
      });
      apiRequest(url, jsonMap); //Sends jsonMap to url
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(AppLocalizations().safeTitle2Category3QuizReturnTrans1, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30.0),),
            content: Text(
              AppLocalizations().safeTitle2Category3QuizReturnTrans2,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  AppLocalizations().safeTitle2Category3QuizReturnTrans3,
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                 onPressed:() {
                   Navigator.push(
                     context, MaterialPageRoute(
                       builder: (context) => (DisplayTopic(
                         topic: ModuleTopic.loadTopics(
                             "Security Tips")[2],
                         module: "Security Tips",
                         count: 2,
                       )),
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
    } else {
      if ((checkBoxValue1 == false) && (checkBoxValue2 == false) && (checkBoxValue3 == false)) {
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
        return;
      }
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
              AppLocalizations().safeTitle2Category3QuizReturnTrans17,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            )),
        body: Column(children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              AppLocalizations().safeTitle2Category3QuizReturnTrans18,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
          ),
          Divider(height: 5.0, color: Colors.black),
          Column(
            children: <Widget>[
              CheckboxListTile(
                  title: Text(
                    AppLocalizations().safeTitle2Category3QuizReturnTrans19,
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  value: checkBoxValue1,
                  onChanged: _value1Changed,
              ),
              Divider(height: 5.0, color: Colors.black),
              CheckboxListTile(
                  title: Text(
                    AppLocalizations().safeTitle2Category3QuizReturnTrans20,
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  value: checkBoxValue2,
                  onChanged: _value2Changed,              
              ),
              Divider(height: 5.0, color: Colors.black),
              CheckboxListTile(
                  title: Text(
                    AppLocalizations().safeTitle2Category3QuizReturnTrans21,
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  value: checkBoxValue3,
                  onChanged: _value3Changed,
              ),
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
          ),
        ],
      ),
    );
  }
}
