import 'package:flutter/material.dart';

class About extends StatelessWidget	{
  @override
  Widget build(BuildContext context) {
		return Container(
			decoration: BoxDecoration(
				image: DecorationImage(
					image: AssetImage("assets/images/wallpaper.png"),
					fit: BoxFit.cover,
				)
			),
			child: Scaffold(
				backgroundColor: Colors.transparent,
				appBar: AppBar(
					title: Text("About"),
					textTheme: TextTheme(title: TextStyle(color: Colors.black, fontSize: 25)),
					centerTitle: true,
					backgroundColor: Colors.white,
					iconTheme: IconThemeData(
						color: Colors.black,
					),
				),
				body: Center(
					child: SingleChildScrollView(
						child: Container(
							alignment: Alignment.center,
							height: 470.0,
							width: 360.0,
							decoration: BoxDecoration(
								color: Colors.white,
								borderRadius: BorderRadius.all(Radius.circular(20.0)),
							),
							child: ListView(
								scrollDirection: Axis.vertical,
								children: <Widget>[
									Padding(
										padding: EdgeInsets.all(8.0),
										child: Text(
											"Credits:\n",
											style: TextStyle(
												height: 1.5,
												fontSize: 20.0,
												color: Colors.black,
												fontWeight: FontWeight.w700,
											),
										),
									),
									Padding(
										padding: EdgeInsets.all(8.0),
										child: Text(
											"1. All background images sourced from Unsplash.com\n",
											textAlign: TextAlign.left,
											style: TextStyle(
												fontSize: 20.0,
												color: Colors.black,
											),
										),
									),
									Padding(
										padding: EdgeInsets.all(8.0),
										child: Text(
											"2. All WhatsApp images sourced from whatsappbrand.com\n",
											textAlign: TextAlign.left,
											style: TextStyle(
												fontSize: 20.0,
												color: Colors.black,
											),
										),
									),
									Padding(
										padding: EdgeInsets.all(8.0),
										child: Text(
											"Disclaimer:\n",
											style: TextStyle(
												height: 1.5,
												fontSize: 20.0,
												color: Colors.black,
												fontWeight: FontWeight.w700,
											),
										),
									),
									Padding(
										padding: EdgeInsets.all(8.0),
										child: Text(
											"1. We are not affiliated, associated, authorized, endorsed by, or in any way officially connected with WhatsApp Inc., or any of its subsidiaries or its affiliates. We do not take reponsibility for decisions/actions taken by the user based solely on the information provided in this application.",
											overflow: TextOverflow.ellipsis,
											maxLines: 8,
											textAlign: TextAlign.left,
											style: TextStyle(
												fontSize: 20.0,
												color: Colors.black,
											),
										),
									),
									Padding(
										padding: EdgeInsets.all(8.0),
										child: Text(
											"\n2. We created this application with the sole intention of teaching the elderlys in Singapore how to use WhatsApp and ways to be safe online.",
											overflow: TextOverflow.ellipsis,
											maxLines: 8,
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
				),
			),
		);
	}
}