import 'package:flutter/material.dart';
//import 'package:learntech/UI/mainScreen.dart';
import 'package:learntech/loadingScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learntech/localizations.dart';

void main() => runApp(new MaterialApp(
	localizationsDelegates: [
		AppLocalizationsDelegate(),
	GlobalMaterialLocalizations.delegate,
	GlobalWidgetsLocalizations.delegate,
	],

	supportedLocales: [Locale("en"), Locale("zh")],

	home: Load(
	),
));

//void main() => runApp(new MaterialApp(
//	home: DisplayTopic(
//	),
//));


/* TODO

1) SilverAppBar show the appbar of the topics
2) Settings, Contact Us & About Page
3) Contact Us BackEnd (Handled by Dave)

4) displayTopic is dynamic
5) topicList returns a ternary function, however topicSelect isn't
dynamic YET

Bug Fixes/Code optimization
a) remove padding on main screen column, switch to align evenlyspaced
b) Fix Language select screen
c) Scroll Screen taller cards


 */
