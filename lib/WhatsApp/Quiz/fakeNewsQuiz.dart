import 'package:flutter/material.dart';
import 'package:learntech/UI/mainScreen.dart';

import '../displayTopic.dart';
import '../topicList.dart';

class FakeNewsQuiz extends StatefulWidget {
  @override
  _FakeNewsQuizState createState() => _FakeNewsQuizState();
}

class _FakeNewsQuizState extends State<FakeNewsQuiz> {
  int radioValue;

  void _radioButton(int value) {
    setState(() {
      radioValue = value;
    });
  }

  void _checkAnswer() {
    if (radioValue == 2) {
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Congratulations!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30.0),),
            content: Text(
              "You have correctly answered the question. Remember to watch out for fake news!\nWell done, you have finished reading all topics!\nPress end to be redirected to the main page.",
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "End",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                onPressed:() {
                  Navigator.push(
                    context, MaterialPageRoute(
                      builder: (context) =>MainPage()
                    ),
                  );
                }
              ),
              RaisedButton(
                child: Text(
                  "Cancel",
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
            title: Text("Oops!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30.0),),
            content: Text(
              "You have answered wrongly. Please try again!",
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
            "Fake News Quiz",
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
              "When receiving fake news you should share it.",
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
        ),
        Divider(height: 5.0, color: Colors.black),
        Column(
            children: <Widget>[
              RadioListTile(
                  title: Text(
                    'True',
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  groupValue: radioValue,
                  value: 1,
                  onChanged: _radioButton
              ),
              Divider(height: 5.0, color: Colors.black),
              RadioListTile(
                  title: Text(
                    'False',
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
                    "Submit!",
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  onPressed: _checkAnswer,
                ),
              ),
            ],
          ),
      ],
    ),
	);
  }
}
