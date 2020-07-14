import 'package:flutter/material.dart';
import 'package:paster/common_widgets/data_tile.dart';
import 'package:paster/common_widgets/widgets.dart';
import 'package:paster/models/data.dart';

import '../utils/utils.dart';

class CreditCardTile extends DataTile {
  final BankCardData card;

  CreditCardTile(this.card) : super(card);

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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CopyToClipBoardWidget(card.cardNumber),
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: delete,
          )
        ],
      ),
    );
  }
}
