import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:paster/common_widgets/error_occurred_widget.dart';
import 'package:paster/common_widgets/uidai_tile.dart';
import 'package:paster/configs/configs.dart';
import 'package:paster/models/data.dart';
import 'package:paster/providers/data_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = DataProvider();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: (){},),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(Sizes.margin),
        child: StreamBuilder<List<DataClass>>(
          stream: dataProvider.data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none)
              return ErrorOccurredWidget();
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator(),);
            if (snapshot.hasError)
              return ErrorOccurredWidget();
            if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
              final data = snapshot.data;
              return ListView.separated(
                itemBuilder: (ctx, i) {
                  if (data[i] is UIDAIData)
                    return UIDAITile(data[i]);
                  return null;
                },
                itemCount: snapshot.data.length,
                separatorBuilder: (ctx, i) {
                  return Divider();
                },
              );
            }
            return ErrorOccurredWidget();
          },
        ),
      ),
    );
  }
}
