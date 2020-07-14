// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class S {
  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static Future<S> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new S();
    });
  }

  String get APP_NAME {
    return Intl.message("Paster", name: 'APP_NAME');
  }

  String get TYPE_UIDAI {
    return Intl.message("UIDAI/Aadhar", name: 'TYPE_UIDAI');
  }

  String get TYPE_CREDIT_CARD {
    return Intl.message("Credit/Debit Card", name: 'TYPE_CREDIT_CARD');
  }

  String get copiedToClipboard {
    return Intl.message("Copied to clipboard", name: 'copiedToClipboard');
  }

  String get noCardNumberValidation {
    return Intl.message(
        "No card number entered", name: 'noCardNumberValidation');
  }

  String get cardInvalid {
    return Intl.message(
        "This card number is invalid, please recheck", name: 'cardInvalid');
  }

  String get uidaiFieldEmpty {
    return Intl.message("This field is required", name: 'uidaiFieldEmpty');
  }

  String get uidaiInvalidValidation {
    return Intl.message("Invalid UIDAI", name: 'uidaiInvalidValidation');
  }

  String get uidaiHintText {
    return Intl.message(
        "Your UIDAI/AADHAR card number here", name: 'uidaiHintText');
  }

  String get nameFieldHint {
    return Intl.message(
        "Enter name of the card holder (optional)", name: 'nameFieldHint');
  }

  String get cvvHintText {
    return Intl.message("CVV", name: 'cvvHintText');
  }

  String get expiryHintText {
    return Intl.message("Expiry date", name: 'expiryHintText');
  }

  String get save {
    return Intl.message("Save", name: 'save');
  }

  String get cardHolderName {
    return Intl.message("Card Holder name", name: 'cardHolderName');
  }


}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),

    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  Future<S> load(Locale locale) {
    return S.load(locale);
  }

  @override
  bool isSupported(Locale locale) =>
      locale != null && supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

// ignore_for_file: unnecessary_brace_in_string_interps
