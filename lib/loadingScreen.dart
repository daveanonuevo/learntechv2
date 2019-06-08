import 'package:flutter/material.dart';
import 'package:learntech/UI/mainScreen.dart';
import 'dart:async';
import 'dart:math' as math;


class Load extends StatefulWidget	{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Load> with TickerProviderStateMixin	{
	AnimationController _animationController;

	@override
  void initState() {
    super.initState();
    _animationController = AnimationController(
				duration: const Duration(seconds: 5),
				vsync: this)..repeat();
    Future.delayed(
			Duration(
					seconds: 5
			),
			(){
				Navigator.push(
					context,
					MaterialPageRoute(
						builder: (context) => MainPage(),
					),
				);
			}
		);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
			body: Stack(
				children: <Widget>[
					AnimatedBuilder(
						animation: _animationController,
						child: Container(
							alignment: Alignment.center,
							decoration: BoxDecoration(
								image: DecorationImage(
									image: ExactAssetImage('assets/images/Cloud.png'),
								),
							),
						),
						builder: (context,child) => Transform.rotate(
								child: child,
								angle: _animationController.value * 2.0 * math.pi,
						),
					),
					Container(
						alignment: Alignment.center,
						decoration: BoxDecoration(
							image: DecorationImage(
								image: ExactAssetImage('assets/images/IPhoneX.png'),
							),
						),
					),
					Center(
						child: Column(
							children: <Widget>[
								Expanded(
									flex: 1,
									child: Column(
										mainAxisAlignment: MainAxisAlignment.end,
										children: <Widget>[
											CircularProgressIndicator(),
											Padding(
												padding: EdgeInsets.all(30.0),
											),
										],
									),
								),
							],
						),
					),
				],
			),
		);
  }
}
