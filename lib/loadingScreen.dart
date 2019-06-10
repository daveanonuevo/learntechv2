import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learntech/UI/mainScreen.dart';
import 'dart:async';
import 'dart:math' as math;

class Load extends StatefulWidget	{
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Load> with TickerProviderStateMixin	{
	AnimationController _animationController, _turnAnimationController, _tmAnimationController;
	Animation _turnAnimation, _tmAnimation;

	@override
  void initState() {
    super.initState();
    _animationController = AnimationController(
			duration: const Duration(seconds: 10),
			vsync: this)..repeat();

    _turnAnimationController = AnimationController(
			duration: const Duration(seconds: 7),
			vsync: this);

    _tmAnimationController = AnimationController(
			duration: const Duration(seconds: 1),
			vsync: this);

    _turnAnimation = Tween(
			begin: 0.0,
			end: 1.0,
		).animate(_turnAnimationController);

    _tmAnimation = Tween(
			begin: 0.0,
			end: 1.0,
		).animate(_tmAnimationController);

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
	void dispose() {
    _animationController.dispose();
    _tmAnimationController.dispose();
    _turnAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
		_turnAnimationController.forward();
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
					FadeTransition(
						opacity: _turnAnimation,
						child: Center(
							child: Container(
								height: 155.0,
								width: 135.0,
								child: Align(
									alignment: Alignment.bottomLeft,
									child: Image.asset(
										'assets/images/LeftTopArrow.png',
									),
								),
							),
						),
					),

					FadeTransition(
						opacity: _turnAnimation,
						child: Center(
							child: Container(
								height: 150.0,
								width: 150.0,
								child: Align(
									alignment: Alignment.bottomRight,
									child: Image.asset(
										'assets/images/RightBottomArrow.png',
									),
								),
							),
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

			FadeTransition(
				opacity: _turnAnimation,
				child: Center(
					child: Column(
						children: <Widget>[
							Expanded(
								flex: 1,
								child: Column(
									mainAxisAlignment: MainAxisAlignment.end,
									children: <Widget>[
										Text(
											"Learn Tech™",
											style: TextStyle(
												fontSize: 30.0,
											),
										),
//											CircularProgressIndicator(),
										Padding(
											padding: EdgeInsets.all(30.0),
										),
									],
								),
							),
						],
					),
				),
			),
				],
			),
		);
  }
}