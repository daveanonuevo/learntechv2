import 'package:flutter/material.dart';
import 'package:learntech/UI/SideBar/contactUs.dart';
//import 'package:learntech/UI/SideBar/settings.dart';
import 'package:learntech/UI/SideBar/about.dart';
import 'package:learntech/localizations.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          Container(
            height: 190,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: ExactAssetImage('assets/Side/SideBar_JewelChangi.png'),
              ),
            ),
          ),
//          new ListTile(
//              leading: new Icon(
//                Icons.settings,
//                color: Colors.black,
//                size: 35,
//              ),
//              title: new Text(
//                "Settings",
//                textAlign: TextAlign.left,
//                style: new TextStyle(fontSize: 25.0),
//              ),
//              onTap: () => Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => Settings()))),
//          new Divider(color: Colors.grey),
          new ListTile(
              leading: new Icon(
                  Icons.phone,
                  color: Colors.black,
                  size: 35
              ),
              title: new Text(
								AppLocalizations.of(context).title,   //translations
                textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 25.0),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ContactPage())) //add on required to navigate other pages
              ),
          new Divider(color: Colors.grey),
          new ListTile(
              leading: new Icon(
                  Icons.info,
                  color: Colors.black,
                  size: 35
              ),
              title: new Text(
                "About",
                textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 25.0),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      About())) //add on required to navigate other pages
              ),
          new Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
