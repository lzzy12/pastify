import 'package:flutter/material.dart';
import 'package:paster/common_widgets/data_tile.dart';
import 'package:paster/common_widgets/widgets.dart';
import 'package:paster/configs/configs.dart';
import 'package:paster/models/data.dart';

class PanCardTile extends DataTile {
  final PANCardData panCard;

  PanCardTile(this.panCard) : super(panCard);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(panCard.panCard!),
        subtitle: Row(
          children: <Widget>[
            Text(panCard.holderName!),
            CopyToClipBoardWidget(panCard.holderName),
          ],
        ),
        leading: Image.asset(
          'assets/images/pan_logo.png',
          height: Sizes.smallImageHeight,
          width: Sizes.smallImageWidth,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CopyToClipBoardWidget(panCard.panCard),
            IconButton(
              onPressed: delete,
              icon: Icon(Icons.delete_outline),
            )
          ],
        ),
      ),
    );
  }
}
