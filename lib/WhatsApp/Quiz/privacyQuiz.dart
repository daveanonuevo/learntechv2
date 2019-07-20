import 'package:flutter/material.dart';

class PrivacyQuiz extends StatefulWidget {
  @override
  _PrivacyQuizState createState() => _PrivacyQuizState();
}

class _PrivacyQuizState extends State<PrivacyQuiz> {
  int radioValue;

  void _radioButton(int value) {
    setState(() {
      radioValue = value;
    });
  }

  void _checkAnswer() {
    if (radioValue == 2) {
      //answer is correct
      return;
    } else {
      //answer is wrong
      return;
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
              "Privacy Quiz",
              style: TextStyle(color: Colors.black),
            )),
        body: Column(children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              "If you want to set your last seen to allow only people you know, which of the following would you choose?",
              style: TextStyle(fontSize: 28),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50.0),
          ),
          Divider(height: 5.0, color: Colors.black),
          Column(
            children: <Widget>[
              RadioListTile(
                  title: Text(
                    'Everyone',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  groupValue: radioValue,
                  value: 1,
                  onChanged: _radioButton),
              Divider(height: 5.0, color: Colors.black),
              RadioListTile(
                  title: Text(
                    'My Contacts',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  groupValue: radioValue,
                  value: 2,
                  onChanged: _radioButton),
              Divider(height: 5.0, color: Colors.black),
              RadioListTile(
                  title: Text(
                    'Nobody',
                    style: new TextStyle(fontSize: 16.0),
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
                "Submit!",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: _checkAnswer,
            ),
          )
        ]));
  }
}
