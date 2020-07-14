import 'package:flutter/material.dart';

class ErrorOccurredWidget extends StatelessWidget {
  final String error;

  ErrorOccurredWidget({this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error ?? 'Oops! Something went wrong!'),
    );
  }
}
