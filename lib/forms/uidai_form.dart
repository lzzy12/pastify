import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:moor/moor.dart' show Value;
import 'package:paster/configs/configs.dart';
import 'package:paster/forms/form.dart';
import 'package:paster/generated/i18n.dart';
import 'package:paster/models/data.dart';
import 'package:paster/utils/utils.dart';

class UIDAIForm extends BaseForm {
  final _data = <String, String>{};

  @override
  Widget build(BuildContext context) {
    final nameNode = useFocusNode();
    final form =
        useMemoized<GlobalKey<FormState>>(() => GlobalKey<FormState>());
    final s = S.of(context);
    return Form(
        key: form,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              validator: (value) {
                final text = CreditCardUtils.getCleanedNumber(value);
                print(text.length);
                if (text.isEmpty) return s.uidaiFieldEmpty;
                if (text.length != 12) return s.uidaiInvalidValidation;
                return null;
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(12),
                UIDAIFormatter()
              ],
              decoration: InputDecoration(
                  hintText: s.uidaiHintText,
                  icon: Image.asset(
                    'assets/images/uidai.png',
                    height: Sizes.smallImageHeight,
                    width: Sizes.smallImageWidth,
                  ),
                  labelText: s.TYPE_UIDAI),
              onSaved: (value) =>
                  _data['uidai'] = CreditCardUtils.getCleanedNumber(value),
              onFieldSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(nameNode),
            ),
            SizedBox(
              height: Sizes.horizontalMargin,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: s.nameFieldHint,
                  icon: Icon(Icons.tag_faces),
                  labelText: s.cardHolderName),
              onSaved: (value) => _data['name'] = value,
              focusNode: nameNode,
            ),
            RaisedButton(
              color: Theme
                  .of(context)
                  .primaryColor,
              child: Text(S
                  .of(context)
                  .save, style: TextStyle(color: Colors.white),),
              onPressed: () => save(context, form),
            )
          ],
        ));
  }

  @override
  Future<void> save(BuildContext context, GlobalKey<FormState> _form) async {
    final form = _form.currentState;
    if (!form.validate()) return;
    form.save();
    final provider = AppDatabase();
    try {
      provider.add(UIDAICompanion(
        uidaiNumber: Value(_data['uidai']),
        name: Value(_data['name']),
      ));
      Navigator.pop(context);
    } catch (e) {}
    super.save(context, _form);
  }
}
