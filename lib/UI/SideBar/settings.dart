import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _localStyle = TextStyle(
    fontSize: 30.0,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    bool blDarkMode = false; //for case(dark mode) but icon missing
    Size wallpaper = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.white,
//		leading: Icon(
//		  Icons.arrow_back,
//		  color: Colors.black,
//		  size: 30.0,
//		),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/Background/wallpaper.png',
              width: wallpaper.width,
              height: wallpaper.height,
              fit: BoxFit.fill,
            ),
          ),
          ListView(children: <Widget>[
            ListTile(
              title: Text(
                "Language:",
                style: _localStyle,
              ),
              trailing: Text("hi"),
            ),
            ListTile(
              title: Text(
                "Dark Mode:",
                style: _localStyle,
              ),
              trailing: GestureDetector(
                onTap: () => {
                  debugPrint("tapped"),
                  setState(() {
                    blDarkMode = !blDarkMode;
                  }),
                },
                child: Switch(
                  value: blDarkMode,
                  onChanged: (value) => {
                    setState(() {
                      blDarkMode = !blDarkMode;
                    }),
                  },
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}

class DarkModeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}