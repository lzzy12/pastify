import 'package:flutter/material.dart';
import 'package:paster/common_widgets/copy_to_clipboard_widget.dart';
import 'package:paster/common_widgets/data_tile.dart';
import 'package:paster/configs/configs.dart';
import 'package:paster/models/data.dart';

class UIDAITile extends DataTile {
  final UIDAIData uidai;

  UIDAITile(this.uidai) : super(uidai);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/uidai.png',
        height: Sizes.smallImageHeight,
        width: Sizes.smallImageWidth,
      ),
      title: Text(uidai.name),
      subtitle: Text(uidai.uidaiNumber),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CopyToClipBoardWidget(uidai.uidaiNumber),
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: delete,
          )
        ],
      ),
    );
  }
}
