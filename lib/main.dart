import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:paster/generated/i18n.dart';
import 'package:paster/models/data.dart';
import 'package:paster/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _db = AppDatabase();
    return MultiProvider(
      providers: [
        StreamProvider<List<UIDAIData>>.value(
          initialData: [],
          value: _db.uidaiStream,
        ),
        StreamProvider<List<PANCardData>>.value(
            initialData: [], value: _db.panStream),
        StreamProvider<List<BankCardData>>.value(
            initialData: [], value: _db.bankCardStream),
        StreamProvider<List<OtherData>>.value(
            initialData: [], value: _db.otherStream),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Pastify',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
