import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learntech/localizations.dart';

class About extends StatelessWidget	{
  @override
  Widget build(BuildContext context) {
		MediaQueryData queryData;
		queryData = MediaQuery.of(context);
		return Container(
			decoration: BoxDecoration(
				image: DecorationImage(
					image: AssetImage("assets/Background/wallpaper.png"),
					fit: BoxFit.cover,
				),
			),
			child: Scaffold(
				backgroundColor: Colors.transparent,
				appBar: AppBar(
					title: Text(AppLocalizations.of(context).aboutTrans),
					textTheme: TextTheme(title: TextStyle(color: Colors.black, fontSize: 25)),
					centerTitle: true,
					backgroundColor: Colors.white,
					iconTheme: IconThemeData(
						color: Colors.black,
					),
				),
				body: Stack(
					children: <Widget>[
						Center(
							child: Padding(
								padding: EdgeInsets.all(10.0),
								child: Text(
									"A project by Students of Ngee Ann Polytechnic",
									style: TextStyle(
										height: 40.0,
										fontSize: 15.0,
										color: Colors.white,
									),
									textAlign: TextAlign.center,
								),
							),
						),
						Center(
							child: Container(
								alignment: Alignment.center,
								height: queryData.size.height / 1.5,
								width: queryData.size.width / 1.15,
								decoration: BoxDecoration(
									color: Colors.white,
									borderRadius: BorderRadius.all(Radius.circular(20.0)),
								),
								child: ListView(
									scrollDirection: Axis.vertical,
									children: <Widget>[
										Padding(
											padding: EdgeInsets.all(10.0),
											child: Text(
												AppLocalizations.of(context).aboutContentTitle1Trans,
												style: TextStyle(
													//height: 1.5,
													fontSize: 20.0,
													color: Colors.black,
													fontWeight: FontWeight.w700,
												),
											),
										),
										Padding(
											padding: EdgeInsets.all(10.0),
											child: Text(
												AppLocalizations.of(context).aboutContent1Title1Trans,
												textAlign: TextAlign.left,
												style: TextStyle(
													fontSize: 20.0,
													color: Colors.black,
												),
											),
										),
										Padding(
											padding: EdgeInsets.all(10.0),
											child: Text(
												AppLocalizations.of(context).aboutContent2Title1Trans,
												textAlign: TextAlign.left,
												style: TextStyle(
													fontSize: 20.0,
													color: Colors.black,
												),
											),
										),
										Padding(
											padding: EdgeInsets.all(10.0),
											child: Text(
												AppLocalizations.of(context).aboutContentTitle2Trans,
												style: TextStyle(
													//height: 1.5,
													fontSize: 20.0,
													color: Colors.black,
													fontWeight: FontWeight.w700,
												),
											),
										),
										Padding(
											padding: EdgeInsets.all(10.0),
											child: Text(
												"1. We are not affiliated, associated, authorized, endorsed by, or in any way officially connected with WhatsApp Inc., or any of its subsidiaries or its affiliates. We do not take responsibility for decisions/actions taken by the user based solely on the information provided in this application.",
												textAlign: TextAlign.left,
												style: TextStyle(
													fontSize: 20.0,
													color: Colors.black,
												),
											),
										),
										Padding(
											padding: EdgeInsets.all(10.0),
											child: Text(
												"2. We created this application with the sole intention of teaching the elderly in Singapore how to use WhatsApp and ways to be safe online.",
												textAlign: TextAlign.left,
												style: TextStyle(
													fontSize: 20.0,
													color: Colors.black,
												),
											),
										),
									],
								),
							),
						),
					],
				),
			),
		);
	}
}