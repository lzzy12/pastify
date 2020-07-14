import 'package:flutter/material.dart';
import 'package:paster/common_widgets/widgets.dart';
import 'package:paster/configs/configs.dart';
import 'package:paster/forms/forms.dart';
import 'package:paster/generated/i18n.dart';

class AddDataBottomModalSheet extends StatefulWidget {
  @override
  _AddDataBottomModalSheetState createState() =>
      _AddDataBottomModalSheetState();
}

class _AddDataBottomModalSheetState extends State<AddDataBottomModalSheet> {
  var _activeIndex = 0;

  Widget _getForm() {
    switch (_activeIndex) {
      case 0:
        return UIDAIForm();
      case 1:
        return CreditCardForm();
      default:
        return ErrorOccurredWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _optionStrings = [
      S.of(context).TYPE_UIDAI,
      S.of(context).TYPE_CREDIT_CARD
    ];
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.3,
        padding: EdgeInsets.all(Sizes.margin),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: <Widget>[
                CustomRadio(
                    scrollDirection: Axis.horizontal,
                    children: List<CustomRadioModal>.generate(
                        _optionStrings.length, (int i) {
                      return CustomRadioModal(
                        value: i,
                        radioText: _optionStrings[i],
                        onPressed: (value) => setState(
                          () => _activeIndex = value,
                        ),
                      );
                    }),
                    activeIndex: _activeIndex),
                SizedBox(
                  height: Sizes.horizontalMargin,
                ),
                _getForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
