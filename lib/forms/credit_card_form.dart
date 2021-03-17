import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moor/moor.dart' show Value;
import 'package:paster/configs/configs.dart';
import 'package:paster/forms/form.dart';
import 'package:paster/generated/i18n.dart';
import 'package:paster/models/data.dart';
import 'package:paster/utils/CreditCardUtils.dart';

class CreditCardForm extends BaseForm {
  final _data = <String, String?>{};

  @override
  Widget build(BuildContext context) {
    final cvvNode = useFocusNode();
    final expiryNode = useFocusNode();
    final _form =
        useMemoized<GlobalKey<FormState>>(() => GlobalKey<FormState>());
    final s = S.of(context)!;
    return Form(
      key: _form,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            onSaved: (value) => _data['cardNumber'] = value,
            onFieldSubmitted: (value) =>
                FocusScope.of(context).requestFocus(cvvNode),
            decoration: InputDecoration(
                icon: Image.asset(
                  'assets/images/cards/unknown.png',
                  height: Sizes.smallImageHeight,
                  width: Sizes.smallImageWidth,
                ),
                hintText: s.TYPE_CREDIT_CARD),
            keyboardType: TextInputType.number,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(19),
              CreditCardFormatter(),
            ],
          ),
          SizedBox(height: Sizes.horizontalMargin),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  onSaved: (value) =>
                      _data['cvv'] = CreditCardUtils.getCleanedNumber(value!),
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(expiryNode),
                  focusNode: cvvNode,
                  decoration: InputDecoration(
                      hintText: s.cvvHintText, icon: Icon(Icons.vpn_key)),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Expanded(
                child: TextFormField(
                  focusNode: expiryNode,
                  onSaved: (value) => _data['expiryDate'] = value,
                  decoration: InputDecoration(
                      icon: Icon(Icons.date_range), hintText: s.expiryHintText),
                ),
              ),
            ],
          ),
          RaisedButton(
            color: Theme
                .of(context)
                .primaryColor,
            child: Text(s.save, style: TextStyle(color: Colors.white),),
            onPressed: () => save(context, _form),
          )
        ],
      ),
    );
  }

  @override
  Future<void> save(BuildContext context, GlobalKey<FormState> _form) async {
    final form = _form.currentState!;
    if (!form.validate()) return;
    form.save();
    final provider = AppDatabase();
    provider.add(BankCardCompanion(
      cardNumber: Value(_data['cardNumber']),
      cvv: Value(_data['cvv']),
      expiryDate: Value(
        _data['expiryDate'],
      ),
    ));
    super.save(context, _form);
  }
}
