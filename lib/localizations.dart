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
		return Intl.message('Email', name: 'contactContentFeedbackButtonTrans');
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









	String get waTitle1DescTrans {
		return Intl.message('Fast, Simple & Secure Messaging and Calling for Free', name: 'waTitle1DescTrans');
	}
	String get waTitle1Category1Trans {
		return Intl.message('Installing WhatsApp', name: 'waTitle1Category1Trans');
	}
	String get waTitle1Category1ContentTrans1 {
		return Intl.message('Find your phone’s App Store and open it, search for WhatsApp and install', name: 'waTitle1Category1ContentTrans1');
	}
	String get waTitle1Category1ContentTrans2 {
		return Intl.message('Congratulations, you have successfully installed WhatsApp!', name: 'waTitle1Category1ContentTrans2');
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
		return Intl.message('Tap or search for the name of the person you wish to message', name: 'waTitle1Category4ContentTrans2');
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
		return Intl.message('Tap or search for the name of the person you wish to send a voice message', name: 'waTitle1Category5ContentTrans2');
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
		return Intl.message('Tap or search for the name of the person you wish to contact', name: 'waTitle1Category6ContentTrans2');
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






	String get safeTitle2Trans {
		return Intl.message('Safety Online Tips', name: 'safeTitle2Trans');
	}
	String get safeTitle2DescTrans {
		return Intl.message('Tips to remain safe in the Internet World', name: 'safeTitle2DescTrans');
	}


	//cont. if correct translations
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