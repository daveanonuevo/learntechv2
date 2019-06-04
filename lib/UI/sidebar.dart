import 'package:flutter/material.dart';
import 'package:learntech/UI/SideBar/contactUs.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
				child: new ListView(
					children: <Widget> [
					Container(
						height: 190,
						decoration: BoxDecoration(
							image: DecorationImage(
								fit: BoxFit.cover,
								image: ExactAssetImage('assets/images/SideBar_JewelChangi.png'),
							),
						),
					),
					new ListTile(
						leading: new Icon(
							Icons.settings,
							color: Colors.black,
							size: 40,
						),
						title: new Text(
							"Settings",
							textAlign: TextAlign.left,
							style: new TextStyle(
								fontSize: 30.0
							),
						),
						onTap: ()=> Navigator.of(context).pop() //add on required to navigate other pages
					),
						new Divider(color: Colors.grey),
						new ListTile(
							leading: new Icon(
								Icons.phone,
								color: Colors.black,
								size: 40
							),
							title: new Text(
								"Contact Us",
								textAlign: TextAlign.left,
								style: new TextStyle(
									fontSize: 30.0
								),
							),
							onTap: ()=> Navigator.of(context).push( MaterialPageRoute(
								builder: (context) =>
									ContactPage()) ) //add on required to navigate other pages
						),
						new Divider(color: Colors.grey),
						new ListTile(
							leading: new Icon(
								Icons.info,
								color: Colors.black,
								size: 40
							),
							title: new Text(
								"About",
								textAlign: TextAlign.left,
								style: new TextStyle(
									fontSize: 30.0
								),
							),
							onTap: ()=> Navigator.of(context).pop() //add on required to navigate other pages
						),
						new Divider(color: Colors.grey),
					],
				),

		);
  }
}