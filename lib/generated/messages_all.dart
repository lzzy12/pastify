// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

final _$en = $en();

class $en extends MessageLookupByLibrary {
  get localeName => 'en';

  final messages = {
    "APP_NAME": MessageLookupByLibrary.simpleMessage("Paster"),
    "TYPE_UIDAI": MessageLookupByLibrary.simpleMessage("UIDAI/Aadhar"),
    "TYPE_CREDIT_CARD":
        MessageLookupByLibrary.simpleMessage("Credit/Debit Card"),
    "TYPE_PAN_CARD": MessageLookupByLibrary.simpleMessage("PAN Card"),
    "copiedToClipboard":
        MessageLookupByLibrary.simpleMessage("Copied to clipboard"),
    "noCardNumberValidation":
        MessageLookupByLibrary.simpleMessage("No card number entered"),
    "cardInvalid": MessageLookupByLibrary.simpleMessage(
        "This card number is invalid, please recheck"),
    "uidaiFieldEmpty":
        MessageLookupByLibrary.simpleMessage("This field is required"),
    "uidaiInvalidValidation":
        MessageLookupByLibrary.simpleMessage("Invalid UIDAI"),
    "uidaiHintText": MessageLookupByLibrary.simpleMessage(
        "Your UIDAI/AADHAR card number here"),
    "nameFieldHint": MessageLookupByLibrary.simpleMessage(
        "Enter name of the card holder (optional)"),
    "cvvHintText": MessageLookupByLibrary.simpleMessage("CVV"),
    "expiryHintText": MessageLookupByLibrary.simpleMessage("Expiry date"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "cardHolderName": MessageLookupByLibrary.simpleMessage("Name on card"),
    "expiringOnText": MessageLookupByLibrary.simpleMessage("Expiring on"),
  };
}



typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  "en": () => Future.value(null),

};

MessageLookupByLibrary? _findExact(localeName) {
  switch (localeName) {
    case "en":
      return _$en;

    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
      localeName,
          (locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? Future.value(false) : lib());

  initializeInternalMessageLookup(() => CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);

  return Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(locale) {
  var actualLocale = Intl.verifiedLocale(locale, _messagesExistFor,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}

// ignore_for_file: unnecessary_brace_in_string_interps
