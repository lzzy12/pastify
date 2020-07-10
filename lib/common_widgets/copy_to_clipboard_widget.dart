import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyToClipBoardWidget extends StatefulWidget {
  final String data;

  CopyToClipBoardWidget(this.data);

  @override
  _CopyToClipBoardWidgetState createState() => _CopyToClipBoardWidgetState();
}

class _CopyToClipBoardWidgetState extends State<CopyToClipBoardWidget> {
  bool _clicked = true;

  void _toggle() async {
    if (_clicked) {
      await Future.delayed(Duration(seconds: 3));
    }
    setState(() {
      _clicked = !_clicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.content_paste),
      onPressed: () async {
        await Clipboard.setData(ClipboardData(text: widget.data));
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Copied to clipboard'),
            duration: Duration(seconds: 3),
          ),
        );
      },
    );
  }
}
