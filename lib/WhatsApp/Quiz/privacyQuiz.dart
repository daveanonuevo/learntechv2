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
            title: Text("Congratulations!", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30.0),),
            content: Text(
              "You have correctly answered the question. Remember to manage your own privacy!\nPress next to be redirected to the next content.",
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
                // onPressed:() {
                //   Navigator.push(
                //     context, MaterialPageRoute(
                //       builder: (context) => (),
                //     ),
                //   );
                // }                
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
    } else if ((radioValue == 3) || (radioValue == 1)) {
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
    } else {
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
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            )),
        body: Column(children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Text(
              "If you want to set your last seen to allow only people you know, which of the following would you choose?",
              style: TextStyle(color: Colors.black, fontSize: 30.0),
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
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  groupValue: radioValue,
                  value: 1,
                  onChanged: _radioButton),
              Divider(height: 5.0, color: Colors.black),
              RadioListTile(
                  title: Text(
                    'My Contacts',
                    style: new TextStyle(color: Colors.black, fontSize: 30.0),
                  ),
                  groupValue: radioValue,
                  value: 2,
                  onChanged: _radioButton),
              Divider(height: 5.0, color: Colors.black),
              RadioListTile(
                  title: Text(
                    'Nobody',
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
                "Submit!",
                style: TextStyle(color: Colors.black, fontSize: 30.0),
              ),
              onPressed: () {
                _checkAnswer();
                _clearAnswer();
              }
            ),
          )
        ]));
  }
}
