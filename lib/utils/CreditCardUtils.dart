import 'package:flutter/services.dart';
import 'package:paster/generated/i18n.dart';

enum CardType {
  electron,
  maestro,
  visa,
  amex,
  mastercard,
  discover,
  dankort,
  interpayment,
  unionpay,
  diners,
  jcb,
  others,
  invalid
}

class CreditCardUtils {
  static const re = <CardType, String>{
    CardType.electron: r'^(4026|417500|4405|4508|4844|4913|4917)\d+$',
    CardType.maestro:
        r'^(5018|5020|5038|5612|5893|6304|6759|6761|6762|6763|0604|6390)\d+$',
    CardType.dankort: r'^(5019)\d+$',
    CardType.interpayment: r'^(636)\d+$',
    CardType.unionpay: r'^(62|88)\d+$',
    CardType.visa: r'^4[0-9]{12}(?:[0-9]{3})?$',
    CardType.mastercard: r'^5[1-5][0-9]{14}$',
    CardType.amex: r'^3[47][0-9]{13}$',
    CardType.diners: r'^3(?:0[0-5]|[68][0-9])[0-9]{11}$',
    CardType.discover: r'^6(?:011|5[0-9]{2})[0-9]{12}$',
    CardType.jcb: r'^(?:2131|1800|35\d{3})\d{11}$'
  };

  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static CardType getCardTypeFromNumber(String number) {
    number = getCleanedNumber(number);
    for (var entry in re.entries)
      if (RegExp(entry.value).hasMatch(number)) return entry.key;
    return CardType.others;
  }

  static String getIconFromCardType(CardType type) {
    switch (type) {
      case CardType.maestro:
        return 'assets/images/cards/maestro.png';
      case CardType.amex:
        return 'assets/images/cards/amex.png';
      case CardType.mastercard:
        return 'assets/images/cards/mastercard.png';
      case CardType.visa:
        return 'assets/images/cards/visa.jpg';
      case CardType.others:
        return 'assets/images/cards/unknown.png';
      case CardType.invalid:
        return 'assets/images/cards/invalid.png';
      default:
        return 'assets/images/cards/unknown.png';
    }
  }

  static String getIconFromCardNumber(String cardNumber) {
    return getIconFromCardType(getCardTypeFromNumber(cardNumber));
  }

  static String? verifyLuhnCard(String input, context) {
    if (input != null && input.isEmpty)
      return S.of(context)!.noCardNumberValidation;
    int sum = 0;
    final cardNumber = getCleanedNumber(input);
    for (int i = 0; i < cardNumber.length; i++) {
      var digit = (int.parse(cardNumber[cardNumber.length - i]));
      if (i % 2 == 1) {
        digit *= 2;
      }
      if (digit > 9) digit = digit - 9;
      sum += digit;
    }
    return sum % 10 == 0 ? null : S.of(context)!.cardInvalid;
  }
}

abstract class _LengthBasedSpaceFormatter extends TextInputFormatter {
  // After how many digits a space character should be added. Must override
  int get length;

  String get replace => '  ';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    final newText = newValue.text;
    final buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      final nonZeroIndex = i + 1;
      if (nonZeroIndex % length == 0 && nonZeroIndex != newText.length) {
        buffer.write(replace);
      }
    }
    final string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class UIDAIFormatter extends _LengthBasedSpaceFormatter {
  @override
  int get length => 4;
}

class PANCardFormatter extends _LengthBasedSpaceFormatter {
  @override
  int get length => 5;
}

class CreditCardFormatter extends _LengthBasedSpaceFormatter {
  @override
  int get length => 4;
}
