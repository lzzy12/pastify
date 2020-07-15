import 'package:flutter/material.dart';
import 'package:paster/common_widgets/data_tile.dart';
import 'package:paster/common_widgets/widgets.dart';
import 'package:paster/configs/configs.dart';
import 'package:paster/generated/i18n.dart';
import 'package:paster/models/data.dart';

import '../utils/utils.dart';

class CreditCardTile extends DataTile {
  final BankCardData card;

  CreditCardTile(this.card) : super(card);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Card(
      child: ExpansionTile(
        leading: Image.asset(
          CreditCardUtils.getIconFromCardNumber(
            card.cardNumber,
          ),
        ),
        title: Text(
          card.cardNumber,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              card.cvv.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.all(Sizes.margin),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'CVV: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            card.cvv,
                          ),
                          CopyToClipBoardWidget(card.cvv)
                        ],
                      ),
                    )
                  : SizedBox(),
              card.expiryDate.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.all(Sizes.margin),
                      child: Row(
                        children: <Widget>[
                          Text(
                            s.expiringOnText + ': ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            card.expiryDate,
                          ),
                          CopyToClipBoardWidget(card.expiryDate)
                        ],
                      ),
                    )
                  : SizedBox(),
              if (card.holderName != null && card.holderName.isNotEmpty)
                Row(children: <Widget>[
                  Text(
                    s.cardHolderName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  CopyToClipBoardWidget(card.holderName),
                ])
              else
                SizedBox()
            ],
          )
        ],
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
      ),
    );
  }
}
