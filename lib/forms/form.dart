import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class BaseForm extends HookWidget {
  Future<void> save(BuildContext context, GlobalKey<FormState> _form) async {
    Navigator.of(context).pop();
  }
}
