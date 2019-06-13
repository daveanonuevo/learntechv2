import 'package:flutter/material.dart';

class LanguageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/Background/wallpaper.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 250.0),
              child: Center(
                child: Text(
                  'Please select\nyour language\n请选择您的语言 ',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 54.0,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
