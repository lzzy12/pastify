import 'package:flutter/material.dart';
import 'package:paster/common_widgets/widgets.dart';
import 'package:paster/configs/configs.dart';
import 'package:paster/generated/i18n.dart';

class AddDataBottomModalSheet extends StatefulWidget {
  @override
  _AddDataBottomModalSheetState createState() =>
      _AddDataBottomModalSheetState();
}

class _AddDataBottomModalSheetState extends State<AddDataBottomModalSheet> {
  var _activeIndex = 0;
  final List<String> _optionStrings = [];

  @override
  void initState() {
    super.initState();
    _optionStrings
        .addAll([S.of(context).TYPE_UIDAI, S.of(context).TYPE_CREDIT_CARD]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Sizes.margin),
      child: Column(
        children: <Widget>[
          CustomRadio(
              scrollDirection: Axis.horizontal,
              children: List<CustomRadioModal<int>>.generate(
                  _optionStrings.length, (int i) {
                return CustomRadioModal<int>(
                  value: i,
                  radioText: _optionStrings[i],
                  onPressed: (value) => setState(
                    () => _activeIndex = value,
                  ),
                );
              }),
              activeIndex: _activeIndex)
        ],
      ),
    );
  }
}
