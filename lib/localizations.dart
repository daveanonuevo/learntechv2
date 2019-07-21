import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:ui';
import 'l10n/messages_all.dart';

class AppLocalizations {
	static AppLocalizations of(BuildContext context) {
		return Localizations.of<AppLocalizations>(context, AppLocalizations);
	}

	static Future<AppLocalizations> load(Locale locale) {
		final String name =
			locale.countryCode == null ? locale.languageCode : locale.toString();
		final String localeName = Intl.canonicalizedLocale(name);

		return initializeMessages(localeName).then((bool _) {
			Intl.defaultLocale = localeName;
			return new AppLocalizations();
		});
	}


	String get contactTrans {
		return Intl.message('Contact Us', name: 'contactTrans');
	}
	String get contactContentTrans {
		return Intl.message('Please provide us with any feedback or comments about the app', name: 'contactContentTrans');
	}
	String get contactContentFeedbackTrans1 {
		return Intl.message('Feedback', name: 'contactContentFeedbackTrans1');
	}
	String get contactContentFeedbackTrans2 {
		return Intl.message('Name', name: 'contactContentFeedbackTrans2');
	}
	String get contactContentFeedbackTrans3 {
		return Intl.message('Email', name: 'contactContentFeedbackTrans3');
	}
	String get contactContentFeedbackButtonTrans {
		return Intl.message('Send', name: 'contactContentFeedbackButtonTrans');
	}
	String get contactSnackBarFeedback {
	  return Intl.message('Missing Feedback', name: 'contactSnackBarFeedback');
	}
	String get contactSnackBarName {
	  return Intl.message('Missing Name', name: 'contactSnackBarName');
	}
	String get contactSnackBarEmail {
	  return Intl.message('Missing Email', name: 'contactSnackBarEmail');
	}
  String get contactSnackBarEmailError {
	  return Intl.message('Invalid Email Address!', name: 'contactSnackBarEmailError');
	}
	String get contactSnackBarFeedbackSuccess {
	  return Intl.message('Feedback Success', name: 'contactSnackBarFeedbackSuccess');
	}
	String get contactSnackBarFeedbackFail {
	  return Intl.message('Feedback Failed', name: 'contactSnackBarFeedbackFail');
	}
	String get aboutTrans {
		return Intl.message('About', name: 'aboutTrans');
	}
	String get aboutContentTitle1Trans {
		return Intl.message('Credits:', name: 'aboutContentTitle1Trans');
	}
	String get aboutContent1Title1Trans {
		return Intl.message('1. All background images sourced from Unsplash.com', name: 'aboutContent1Title1Trans');
	}
	String get aboutContent2Title1Trans {
		return Intl.message('2. All WhatsApp images sourced from whatsappbrand.com', name: 'aboutContent2Title1Trans');
	}
	String get aboutContentTitle2Trans {
		return Intl.message('Disclaimer:', name: 'aboutContentTitle2Trans');
	}
	String get aboutContent1Title2Trans {
		return Intl.message('1. We are not affiliated, associated, authorized, endorsed by, or in any way officially connected with WhatsApp Inc., or any of its subsidiaries or its affiliates. We do not take responsibility for decisions/actions taken by the user based solely on the information provided in this application.', name: 'aboutContent1Title2Trans');
	}
	String get aboutContent2Title2Trans {
		return Intl.message('2. We created this application with the sole intention of teaching the elderly in Singapore how to use WhatsApp and ways to be safe online.', name: 'aboutContent2Title2Trans');
	}
	String get aboutContentTailTrans {
		return Intl.message('A project by Students of Ngee Ann Polytechnic', name: 'aboutContentTailTrans');
	}
	String get waTitle1Trans {
		return Intl.message('WhatsApp Guides', name: 'waTitle1Trans');
	}
	String get waTitle1DescTrans {
		return Intl.message('Fast, Simple & Secure Messaging and Calling for Free', name: 'waTitle1DescTrans');
	}
	String get waTitle1Category1Trans {
		return Intl.message('Installing WhatsApp', name: 'waTitle1Category1Trans');
	}
	String get waTitle1Category1ContentTrans1 {
		return Intl.message('Find your phone’s App Store or Play Store and open it', name: 'waTitle1Category1ContentTrans1');
	}
	String get waTitle1Category1ContentTrans2 {
		return Intl.message('Search for WhatsApp and install', name: 'waTitle1Category1ContentTrans2');
	}
	String get waTitle1Category1ContentTrans3 {
		return Intl.message('Congratulations, you have successfully installed WhatsApp!', name: 'waTitle1Category1ContentTrans3');
	}
	String get waTitle1Category2Trans {
		return Intl.message('Creating An Account', name: 'waTitle1Category2Trans');
	}
	String get waTitle1Category2ContentTrans1 {
		return Intl.message('Open WhatsApp and key in your phone number and country code, tap on Next when done', name: 'waTitle1Category2ContentTrans1');
	}
	String get waTitle1Category2ContentTrans2 {
		return Intl.message('Allow all permissions it requests of you to prevent the prompts from popping out again', name: 'waTitle1Category2ContentTrans2');
	}
	String get waTitle1Category2ContentTrans3 {
		return Intl.message('Edit your profile name and photo', name: 'waTitle1Category2ContentTrans3');
	}
	String get waTitle1Category3Trans {
		return Intl.message('Adding Contacts', name: 'waTitle1Category3Trans');
	}
	String get waTitle1Category3ContentTrans1 {
		return Intl.message('Tap the Message Icon on the bottom right corner', name: 'waTitle1Category3ContentTrans1');
	}
	String get waTitle1Category3ContentTrans2 {
		return Intl.message('Tap on New Contact', name: 'waTitle1Category3ContentTrans2');
	}
	String get waTitle1Category3ContentTrans3 {
		return Intl.message('Fill in the name and handphone number of an individual and tap \"Save\" when done', name: 'waTitle1Category3ContentTrans3');
	}
	String get waTitle1Category4Trans {
		return Intl.message('Sending Messages', name: 'waTitle1Category4Trans');
	}
	String get waTitle1Category4ContentTrans1 {
		return Intl.message('Tap on the Message Icon, located bottom right corner', name: 'waTitle1Category4ContentTrans1');
	}
	String get waTitle1Category4ContentTrans2 {
		return Intl.message('Search for the name of the person you wish to message and tap on it', name: 'waTitle1Category4ContentTrans2');
	}
	String get waTitle1Category4ContentTrans3 {
		return Intl.message('Tap on the bottom text field and type your message using the keyboard', name: 'waTitle1Category4ContentTrans3');
	}
	String get waTitle1Category4ContentTrans4 {
		return Intl.message('When you have completed typing, tap the Arrow Icon on the bottom right corner', name: 'waTitle1Category4ContentTrans4');
	}
	String get waTitle1Category5Trans {
		return Intl.message('Sending Voice Memos', name: 'waTitle1Category5Trans');
	}
	String get waTitle1Category5ContentTrans1 {
		return Intl.message('Tap on the Message Icon, located bottom right corner', name: 'waTitle1Category5ContentTrans1');
	}
	String get waTitle1Category5ContentTrans2 {
		return Intl.message('Search for the name of the person you wish to send a voice message and tap on it', name: 'waTitle1Category5ContentTrans2');
	}
	String get waTitle1Category5ContentTrans3 {
		return Intl.message('Press and hold the microphone icon on the bottom right, and start speaking', name: 'waTitle1Category5ContentTrans3');
	}
	String get waTitle1Category5ContentTrans4 {
		return Intl.message('Once you have completed, release the microphone icon and your message will be sent, or swipe left for it to be discarded', name: 'waTitle1Category5ContentTrans4');
	}
	String get waTitle1Category6Trans {
		return Intl.message('Sending Media', name: 'waTitle1Category6Trans');
	}
	String get waTitle1Category6ContentTrans1 {
		return Intl.message('Tap on the Message Icon, located bottom right corner', name: 'waTitle1Category6ContentTrans1');
	}
	String get waTitle1Category6ContentTrans2 {
		return Intl.message('Search for the name of the person you wish to contact and tap on it', name: 'waTitle1Category6ContentTrans2');
	}
	String get waTitle1Category6ContentTrans3 {
		return Intl.message('Tap on the paperclip that is on the right of the Message Text Field', name: 'waTitle1Category6ContentTrans3');
	}
	String get waTitle1Category6ContentTrans4 {
		return Intl.message('Select the media type you wish to send and follow through accordingly', name: 'waTitle1Category6ContentTrans4');
	}
	String get waTitle1Category6ContentTrans5 {
		return Intl.message('Here\'s an example of sharing a photo', name: 'waTitle1Category6ContentTrans5');
	}
	String get waTitle1Category6ContentTrans6 {
		return Intl.message('Here\'s an example of sharing your location \n*You may need to allow your phone permissions to do this', name: 'waTitle1Category6ContentTrans6');
	}
	String get waTitle1Category7Trans {
		return Intl.message('Giving Voice Calls', name: 'waTitle1Category7Trans');
	}
	String get waTitle1Category7ContentTrans1 {
		return Intl.message('Tap on the Message Icon, located bottom right corner and search for the name of the person you wished to call and tap on it', name: 'waTitle1Category7ContentTrans1');
	}
	String get waTitle1Category7ContentTrans2 {
		return Intl.message('Tap on the Telephone Icon located at the top of the screen', name: 'waTitle1Category7ContentTrans2');
	}
	String get waTitle1Category7ContentTrans3 {
		return Intl.message('You may need to allow permissions', name: 'waTitle1Category7ContentTrans3');
	}
	String get waTitle1Category8Trans {
		return Intl.message('Answering Voice Calls', name: 'waTitle1Category8Trans');
	}
	String get waTitle1Category8ContentTrans1 {
		return Intl.message('Your phone will look like this when you receive a call', name: 'waTitle1Category8ContentTrans1');
	}
	String get waTitle1Category8ContentTrans2 {
		return Intl.message('Press and hold the green button, and then swipe up to answer', name: 'waTitle1Category8ContentTrans2');
	}
	String get waTitle1Category8ContentTrans3 {
		return Intl.message('Or press and swipe up the red telephone to decline', name: 'waTitle1Category8ContentTrans3');
	}
	String get waTitle1Category9Trans {
		return Intl.message('Creating Group Chats', name: 'waTitle1Category9Trans');
	}
	String get waTitle1Category9ContentTrans1 {
		return Intl.message('Tap on the Message Icon, located bottom right corner', name: 'waTitle1Category9ContentTrans1');
	}
	String get waTitle1Category9ContentTrans2 {
		return Intl.message('Tap on New Group', name: 'waTitle1Category9ContentTrans2');
	}
	String get waTitle1Category9ContentTrans3 {
		return Intl.message('Select all the contacts you wish to be inside the group', name: 'waTitle1Category9ContentTrans3');
	}
	String get waTitle1Category9ContentTrans4 {
		return Intl.message('Tap on the arrow, located bottom right corner, to proceed', name: 'waTitle1Category9ContentTrans4');
	}
	String get waTitle1Category9ContentTrans5 {
		return Intl.message('Give the group a name and tap the "tick" to finish', name: 'waTitle1Category9ContentTrans5');
	}
	String get safeTitle2Trans {
		return Intl.message('Safety Online Tips', name: 'safeTitle2Trans');
	}
	String get safeTitle2DescTrans {
		return Intl.message('Tips to remain safe in the Internet World', name: 'safeTitle2DescTrans');
	}
	String get safeTitle2Category1Trans {
		return Intl.message('Protecting your Privacy', name: 'safeTitle2Category1Trans');
	}
	String get safeTitle2Category1ContentTrans1 {
		return Intl.message('Tap on the Settings icon, located top right of your phone', name: 'safeTitle2Category1ContentTrans1');
	}
	String get safeTitle2Category1ContentTrans2 {
		return Intl.message('Tap Account then Privacy', name: 'safeTitle2Category1ContentTrans2');
	}
	String get safeTitle2Category1ContentTrans3 {
		return Intl.message('Tap Last Seen, Select My Contacts', name: 'safeTitle2Category1ContentTrans3');
	}
	String get safeTitle2Category1ContentTrans4 {
		return Intl.message('\n*This allows only those who are in your contacts to know when was the last time you used WhatsApp and settings are of personal preference', name: 'safeTitle2Category1ContentTrans4');
	}
	String get safeTitle2Category2Trans {
		return Intl.message('Identifying Scams', name: 'safeTitle2Category2Trans');
	}
	String get safeTitle2Category2ContentTrans1 {
		return Intl.message('When receiving messages from unknown senders indicating you have won money/lucky draw, always check if you had indeed participated in a lucky draw or an event related to winning a prize.', name: 'safeTitle2Category2ContentTrans1');
	}
	String get safeTitle2Category2ContentTrans2 {
		return Intl.message('You SHOULD NOT be asked for personal information such as your credit card number etc.', name: 'safeTitle2Category2ContentTrans2');
	}
  String get safeTitle2Category2ContentTrans3 {
		return Intl.message('Prerequisites like requiring you to pay before you can claim your prize are fake.', name: 'safeTitle2Category2ContentTrans3');
	}
  String get safeTitle2Category2ContentTrans4 {
		return Intl.message('DO NOT fall victim into such messages as they are scamming you. Ignoring such messages will be the best response to such situations. Nothing is free in this world!', name: 'safeTitle2Category2ContentTrans4');
	}
	String get safeTitle2Category3Trans {
		return Intl.message('Identifying Fake News', name: 'safeTitle2Category3Trans');
	}
	String get safeTitle2Category3ContentTrans1 {
		return Intl.message('When you receive news related messages from your friends or others, read it carefully and check if it’s authentic.', name: 'safeTitle2Category3ContentTrans1');
	}
	String get safeTitle2Category3ContentTrans2 {
		return Intl.message('If it sounds too good to be true, it’s probably fake! Do not forward fake news to others as that can cause distress. Alert the individual that the message sent by him/her is fake and be advised to delete the message. This prevents the message from being spread further.', name: 'safeTitle2Category3ContentTrans2');
	}
  String get safeTitle2Category3TitleQuizTrans {
		return Intl.message('Fake News Quiz', name: 'safeTitle2Category3TitleQuizTrans');
	}
  String get safeTitle2Category3QuizTrans1 {
		return Intl.message('When receiving fake news you should share it.', name: 'safeTitle2Category3QuizTrans1');
	}
  String get safeTitle2Category3QuizTrans2 {
		return Intl.message('True', name: 'safeTitle2Category3QuizTrans2');
	}
  String get safeTitle2Category3QuizTrans3 {
		return Intl.message('False', name: 'safeTitle2Category3QuizTrans3');
	}
  String get safeTitle2Category3QuizTrans4 {
		return Intl.message('Submit', name: 'safeTitle2Category3QuizTrans4');
	}
  String get safeTitle2Category3QuizReturnTrans1 {
		return Intl.message('Congratulations!', name: 'safeTitle2Category3QuizReturnTrans1');
	}
  String get safeTitle2Category3QuizReturnTrans2 {
		return Intl.message('You have correctly answered the question. Be smart and watch out for scams!\nPress next to be redirected to the next content.', name: 'safeTitle2Category3QuizReturnTrans2');
	}
  String get safeTitle2Category3QuizReturnTrans3 {
		return Intl.message('Next', name: 'safeTitle2Category3QuizReturnTrans3');
	}
  String get safeTitle2Category3QuizReturnTrans4 {
		return Intl.message('Cancel', name: 'safeTitle2Category3QuizReturnTrans4');
	}
  String get safeTitle2Category3QuizReturnTrans5 {
		return Intl.message('You have correctly answered the question. Remember to watch out for fake news!\nWell done, you have finished reading all topics!\nPress end to be redirected to the main page.', name: 'safeTitle2Category3QuizReturnTrans5');
	}
  String get safeTitle2Category3QuizReturnTrans6 {
		return Intl.message('End', name: 'safeTitle2Category3QuizReturnTrans6');
	}
  String get safeTitle2Category3QuizReturnTrans7 {
		return Intl.message('Oops', name: 'safeTitle2Category3QuizReturnTrans7');
	}
  String get safeTitle2Category3QuizReturnTrans8 {
		return Intl.message('You have answered wrongly. Please try again!', name: 'safeTitle2Category3QuizReturnTrans8');
	}
  String get safeTitle2Category3QuizReturnTrans9 {
		return Intl.message('Please Select An Answer!', name: 'safeTitle2Category3QuizReturnTrans9');
	}
  String get safeTitle2Category3QuizReturnTrans10 {
		return Intl.message('Nice try, you can\'t find any answers here!', name: 'safeTitle2Category3QuizReturnTrans10');
	}
  String get safeTitle2Category3QuizReturnTrans11 {
		return Intl.message('You have correctly answered the question. Remember to manage your own privacy!\nPress next to be redirected to the next content.', name: 'safeTitle2Category3QuizReturnTrans11');
	}
  String get safeTitle2Category3QuizReturnTrans12 {
		return Intl.message('Privacy Quiz', name: 'safeTitle2Category3QuizReturnTrans12');
	}
  String get safeTitle2Category3QuizReturnTrans13 {
		return Intl.message('If you want to set your last seen to allow only people you know, which of the following would you choose?', name: 'safeTitle2Category3QuizReturnTrans13');
	}
  String get safeTitle2Category3QuizReturnTrans14 {
		return Intl.message('Everyone', name: 'safeTitle2Category3QuizReturnTrans14');
	}
  String get safeTitle2Category3QuizReturnTrans15 {
		return Intl.message('My Contacts', name: 'safeTitle2Category3QuizReturnTrans15');
	}
  String get safeTitle2Category3QuizReturnTrans16 {
		return Intl.message('Nobody', name: 'safeTitle2Category3QuizReturnTrans16');
	}
  String get safeTitle2Category3QuizReturnTrans17 {
		return Intl.message('Scams Quiz', name: 'safeTitle2Category3QuizReturnTrans17');
	}
  String get safeTitle2Category3QuizReturnTrans18 {
		return Intl.message('What\'s a sign that something is a scam? (Select all appropriate answers)', name: 'safeTitle2Category3QuizReturnTrans18');
	}
  String get safeTitle2Category3QuizReturnTrans19 {
		return Intl.message('It comes from an unknown sender', name: 'safeTitle2Category3QuizReturnTrans19');
	}
  String get safeTitle2Category3QuizReturnTrans20 {
		return Intl.message('It asks for credit card details', name: 'safeTitle2Category3QuizReturnTrans20');
	}
  String get safeTitle2Category3QuizReturnTrans21 {
		return Intl.message('It\'s too good to be true', name: 'safeTitle2Category3QuizReturnTrans21');
	}
  String get safeTitle2Category3QuizReturnTrans22 {
		return Intl.message('Ready for a quiz?', name: 'safeTitle2Category3QuizReturnTrans22');
	}
}

class AppLocalizationsDelegate
		extends LocalizationsDelegate<AppLocalizations> {
	const AppLocalizationsDelegate();

	@override
	bool isSupported(Locale locale) {
		return ['en', 'zh'].contains(locale.languageCode);
	}

	@override
	Future<AppLocalizations> load(Locale locale) =>
			AppLocalizations.load(locale);

	@override
	bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}