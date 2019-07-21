import 'package:flutter/material.dart';

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
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Congratulations!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30.0),),
            content: Text(
              "You have correctly answered the question. Be smart and watch out for scams!\nPress next to be redirected to the next content.",
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "Next",
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
      if ((checkBoxValue1 == false) && (checkBoxValue2 == false) && (checkBoxValue3 == false)) {
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Please Select An Answer!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30.0),),
              content: Text(
                "Nice try, you can't find any answers here!",
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
              "Scams Quiz",
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            )),
        body: Column(children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              "What's a sign that something is a scam? (Select all appropriate answers)",
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
          ),
          Divider(height: 5.0, color: Colors.black),
          Column(
            children: <Widget>[
              CheckboxListTile(
                  title: Text(
                    'It comes from an unknown sender',
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  value: checkBoxValue1,
                  onChanged: _value1Changed,
              ),
              Divider(height: 5.0, color: Colors.black),
              CheckboxListTile(
                  title: Text(
                    'It asks for credit card details',
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  value: checkBoxValue2,
                  onChanged: _value2Changed,              
                  // value: 2,
                  // onChanged: _checkBox
              ),
              Divider(height: 5.0, color: Colors.black),
              CheckboxListTile(
                  title: Text(
                    'It\'s too good to be true',
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  value: checkBoxValue3,
                  onChanged: _value3Changed,
                  // value: 3,
                  // onChanged: _checkBox
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
                "Submit!",
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              onPressed: () {
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
