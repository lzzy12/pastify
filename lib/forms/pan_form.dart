import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moor/moor.dart' show Value;
import 'package:paster/configs/configs.dart';
import 'package:paster/forms/form.dart';
import 'package:paster/generated/i18n.dart';
import 'package:paster/models/data.dart';
import 'package:paster/utils/utils.dart' show PANCardFormatter;

class PanCardForm extends BaseForm {
  final _data = <String, String>{};
  static const _HOLDER_NAME_FIELD = "holderName";

  static const _PAN_CARD_FIELD = "panCard";

  @override
  Widget build(BuildContext context) {
    final cardHolderNameNode = useFocusNode();
    final _form =
        useMemoized<GlobalKey<FormState>>(() => GlobalKey<FormState>());
    final s = S.of(context);
    return Form(
      key: _form,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            onSaved: (value) => _data[_PAN_CARD_FIELD] = value.trim(),
            onFieldSubmitted: (value) =>
                FocusScope.of(context).requestFocus(cardHolderNameNode),
            decoration: InputDecoration(
                icon: Image.asset(
                  'assets/images/pan_logo.png',
                  height: Sizes.smallImageHeight,
                  width: Sizes.smallImageWidth,
                ),
                hintText: s.TYPE_PAN_CARD),
            keyboardType: TextInputType.text,
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp(r'[A-Za-z0-9]')),
              LengthLimitingTextInputFormatter(10),
              PANCardFormatter(),
            ],
          ),
          SizedBox(height: Sizes.horizontalMargin),
          TextFormField(
            autofocus: true,
            focusNode: cardHolderNameNode,
            onSaved: (value) => _data[_HOLDER_NAME_FIELD] = value.trim(),
            decoration: InputDecoration(
                icon: Icon(Icons.tag_faces), hintText: s.cardHolderName),
            keyboardType: TextInputType.text,
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              s.save,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => save(context, _form),
          )
        ],
      ),
    );
  }

  @override
  Future<void> save(BuildContext context, GlobalKey<FormState> _form) async {
    final form = _form.currentState;
    if (!form.validate()) return;
    form.save();
    final provider = AppDatabase();
    provider.add(PANCardCompanion(
      panCard: Value(_data[_PAN_CARD_FIELD]),
      holderName: Value(_data[_HOLDER_NAME_FIELD]),
    ));
    super.save(context, _form);
  }
}
