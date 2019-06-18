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
							child: Column(
								mainAxisAlignment: MainAxisAlignment.end,
								children: <Widget>[
									Text(
										AppLocalizations.of(context).aboutContentTailTrans,
										style: TextStyle(
										fontSize: 15.0,
											color: Colors.white,
										),
										textAlign: TextAlign.center,
									),
									Padding(
										padding: EdgeInsets.all(20.0),
									),
								],
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
												AppLocalizations.of(context).aboutContent1Title2Trans,
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
												AppLocalizations.of(context).aboutContent2Title2Trans,
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