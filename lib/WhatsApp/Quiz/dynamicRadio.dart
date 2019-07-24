import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:learntech/WhatsApp/Quiz/dynamicQuiz.dart';
import 'package:learntech/requests/api.dart';

import 'package:learntech/localizations.dart';

class DynamicRadio extends StatefulWidget {
  DynamicRadio(
      {Key key,
      @required this.question,
      @required this.correctAnswer,
      @required this.options,
      @required this.title})
      : super(key: key);

  final String question;
  final List<dynamic> correctAnswer;
  final List<dynamic> options;
  final String title;

  @override
  _DynamicRadioState createState() => _DynamicRadioState();
}

class _DynamicRadioState extends State<DynamicRadio> {
  String radioValue;
  int attemptCounter = 0;
  String url =
      "https://us-central1-learntech-d9387.cloudfunctions.net/widgets/attempts/";

  void _radioButton(String value) {
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
    if (radioValue == widget.correctAnswer[0]) {
      String jsonMap = jsonEncode({
        'attempts': attemptCounter,
        'question': '${widget.title}'
      });
      apiRequest(url, jsonMap); //Sends jsonMap to url
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                AppLocalizations().safeTitle2Category3QuizReturnTrans1,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("You got it right! Press end to try out more questions!",
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DynamicQuiz()),
                      );
                    }),
                RaisedButton(
                  child: Text(
                    AppLocalizations().safeTitle2Category3QuizReturnTrans4,
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                AppLocalizations().safeTitle2Category3QuizReturnTrans7,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 30.0),
              ),
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
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
        body: Column(children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              widget.question,
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          ),
          Divider(height: 5.0, color: Colors.black),
          ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) => RadioListTile(
                  title: Text(
                    widget.options[index],
                    style: TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  groupValue: radioValue,
                  value: widget.options[index].toString(),
                  onChanged: _radioButton),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
              itemCount: widget.options.length),
          ButtonTheme(
            minWidth: 200.0,
            height: 70,
            child: RaisedButton(
                color: Colors.white30,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                onPressed: () {
                  attemptCounter++;
                  _checkAnswer();
                  _clearAnswer();
                }),
          ),
        ]));
  }
}
