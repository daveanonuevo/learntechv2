import 'package:flutter/material.dart';
import 'package:learntech/WhatsApp/Quiz/privacyQuiz.dart';
import 'package:learntech/loadingScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learntech/localizations.dart';

//void main() => runApp(new MaterialApp(
//	localizationsDelegates: [
//		AppLocalizationsDelegate(),
//	GlobalMaterialLocalizations.delegate,
//	GlobalWidgetsLocalizations.delegate,
//	],
//
//	supportedLocales: [Locale("en"), Locale("zh")],
//
//	home: Load(
//	),
//));

void main() => runApp(new MaterialApp(
	home: PrivacyQuiz(
	),
));

