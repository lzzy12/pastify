import 'package:flutter/material.dart';
import 'package:paster/common_widgets/copy_to_clipboard_widget.dart';
import 'package:paster/models/data.dart';

class UIDAITile extends StatelessWidget {
  final UIDAIData uidai;
  UIDAITile(this.uidai);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/uidai.png'),
      title: Text(uidai.name),
      subtitle: Text(uidai.uidaiNumber),
      trailing: CopyToClipBoardWidget(uidai.uidaiNumber),
    );
  }
}
