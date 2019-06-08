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

					Center(
						child: Column(
							children: <Widget>[
								Expanded(
									flex: 1,
									child: Column(
										mainAxisAlignment: MainAxisAlignment.end,
										children: <Widget>[
											Image.asset('assets/images/LeftTopArrow.png'),
											Padding(
												padding: EdgeInsets.only(bottom:267.0, left: 190.0),
											),
										],
									),
								),
							],
						),
					),
					Center(
								child: Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>[
										Image.asset('assets/images/RightBottomArrow.png'),
//										Padding(
//											padding: EdgeInsets.only(bottom: 400.0),
//										),
									],
								),
						),
						//height: 300.0,
//						width: 300.0,
//						child: Column(
//							children: <Widget>[
//								Image.asset('assets/images/RightBottomArrow.png'),
//								Padding(
//									padding: EdgeInsets.only(bottom: 400.0),
//								),
//							],
//						),
//					Center(
//						child: Column(
//							children: <Widget>[
//								Expanded(
//									flex: 1,
//									child: Column(
//										mainAxisAlignment: MainAxisAlignment.end,
//										children: <Widget>[
//											Image.asset('assets/images/RightBottomArrow.png'),
//
////											Padding(
////												padding: EdgeInsets.only(bottom:300.0, right: 190.0),
////											),
//										],
//									),
//								),
//							],
//						),
//					),

//								Image.asset(
//										'assets/images/LeftTopArrow.png',
//										height: 830.0,
//										width: 950.0,
//								),

//					Container(
//						alignment: Alignment.bottomCenter,
//						height: 100.0,
//						decoration: BoxDecoration(
//							image: DecorationImage(
//								image: ExactAssetImage('assets/images/LeftTopArrow.png'),
//							),
//						),
//					),
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
