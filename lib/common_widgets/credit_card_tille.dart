import 'package:flutter/material.dart';
import 'package:paster/common_widgets/widgets.dart';
import 'package:paster/models/data.dart';

import '../utils/utils.dart';

class CreditCardTile extends StatelessWidget {
  final BankCardData card;

  CreditCardTile(this.card);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        CreditCardUtils.getIconFromCardNumber(
          card.cardNumber,
        ),
      ),
      title: Text(
        card.cardNumber,
      ),
      subtitle: Row(
        children: <Widget>[Text(card.cvv), CopyToClipBoardWidget(card.cvv)],
      ),
      trailing: CopyToClipBoardWidget(card.cardNumber),
    );
  }
}
