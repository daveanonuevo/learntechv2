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


	String get title {
		return Intl.message('Contact Us', name: 'title');
	}
	//cont. if correct
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