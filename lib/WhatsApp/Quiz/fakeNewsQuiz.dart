import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learntech/UI/SideBar/contactUs.dart';
import 'package:learntech/UI/mainScreen.dart';
import 'package:learntech/localizations.dart';

class FakeNewsQuiz extends StatefulWidget {
  @override
  _FakeNewsQuizState createState() => _FakeNewsQuizState();
}

class _FakeNewsQuizState extends State<FakeNewsQuiz> {
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
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(AppLocalizations().safeTitle2Category3QuizReturnTrans5,
                  style: TextStyle(color: Colors.black, fontSize: 30.0)),
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  AppLocalizations().safeTitle2Category3QuizReturnTrans6,
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                onPressed:() {
                  String jsonMap = jsonEncode({
                    'attempts': attemptCounter,
                    'question': '${AppLocalizations().safeTitle2Category3TitleQuizTrans}'
                  });
                  apiRequest(url, jsonMap); //Sends jsonMap to url
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) =>MainPage()
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
      if (radioValue == 1) {
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
        return;
      }
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
  Widget build(BuildContext context) {
	return Scaffold(
	  body: Column(
      children: <Widget>[
        AppBar(
          backgroundColor: Colors.white,
          title: Text(
            AppLocalizations().safeTitle2Category3TitleQuizTrans,
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 40.0),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              AppLocalizations().safeTitle2Category3QuizTrans1,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
        ),
        Divider(height: 5.0, color: Colors.black),
        Column(
            children: <Widget>[
              RadioListTile(
                  title: Text(
                    AppLocalizations().safeTitle2Category3QuizTrans2,
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  groupValue: radioValue,
                  value: 1,
                  onChanged: _radioButton
              ),
              Divider(height: 5.0, color: Colors.black),
              RadioListTile(
                  title: Text(
                    AppLocalizations().safeTitle2Category3QuizTrans3,
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  groupValue: radioValue,
                  value: 2,
                  onChanged: _radioButton),
              Divider(height: 5.0, color: Colors.black),
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
      ],
    ),
	);
  }
}
