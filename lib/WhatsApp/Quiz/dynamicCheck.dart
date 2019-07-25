import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learntech/requests/api.dart';
import 'package:learntech/localizations.dart';
import 'dynamicQuiz.dart';


class DynamicCheck extends StatefulWidget {
  DynamicCheck(
      {Key key,
        @required this.question,
        @required this.correctAnswer,
        @required this.options,
        @required this.title})
      : super(key: key);
  final String question;
  final List<String> correctAnswer;
  final List<String> options;
  final String title;
  @override
  _DynamicCheckState createState() => _DynamicCheckState();
}

class _DynamicCheckState extends State<DynamicCheck> {
  String url =
    "https://us-central1-learntech-d9387.cloudfunctions.net/widgets/attempts/";
  List<bool> checkBoxValue = [];
  List<int> intAnswers = [];
  int attemptCounter = 0 ;

  @override
  void initState() {
    //Create a boolean list
    for (int x=0; x <= widget.options.length; x++)
      {
        checkBoxValue.add(false);
      }
    //Creates a list that maps index of correctAnswers to the answers
    for (int x=0; x <= widget.options.length; x++)
      {
        for (int count=0; count <= widget.correctAnswer.length; count++)
          if (widget.options[x] == widget.correctAnswer[count])
            intAnswers.add(x);
      }
    super.initState();
  }

  void _checkAnswer(){
    //extract int count of trues
    List<int> givenIndex = [];
    for (int y=0; y <= checkBoxValue.length; y++)
      {
        if (checkBoxValue[y] == true)
          {
            givenIndex.add(y);
          }
      }
    for (int z=0; z <= widget.correctAnswer.length; z++)
      {
        //TODO (If I am not wrong u wanna send it to firebase stats)
        String jsonMap = jsonEncode({
        'attempts': attemptCounter,
        'question': '${widget.title}'
        });
        apiRequest(url, jsonMap);
      }
  }

  void _clearAnswer() {
    for (int w = 0; w <= checkBoxValue.length; w++) {
      setState(() {
        checkBoxValue[w] = null;
      });
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
        Divider(height: 5.0, color: Colors.black),
        ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) => CheckboxListTile(
              title: Text(
                widget.options[index],
                style: new TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              value: checkBoxValue[index],
              onChanged: (value) => setState(() => checkBoxValue[index] = value),
            ),
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
            ),
            itemCount: widget.options.length),
        Padding(
          padding: EdgeInsets.all(15),
        ),
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
              }
          ),
        ),
      ],
      ),
    );
  }
}
