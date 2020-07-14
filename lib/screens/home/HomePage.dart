import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:paster/common_widgets/widgets.dart';
import 'package:paster/configs/configs.dart';
import 'package:paster/generated/i18n.dart';
import 'package:paster/models/data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uidaiProvider = Provider.of<List<UIDAIData>>(context);
    final panProvider = Provider.of<List<PANCardData>>(context);
    final cardProvider = Provider.of<List<BankCardData>>(context);
    final s = S.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).APP_NAME),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Tab>[
              Tab(
                text: s.TYPE_CREDIT_CARD,
                icon: Icon(Icons.credit_card),
              ),
              Tab(
                text: s.TYPE_UIDAI,
                icon: Image.asset(
                  'assets/images/uidai.png',
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) => AddDataBottomModalSheet(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          Sizes.radius,
                        ),
                        topRight: Radius.circular(Sizes.radius)),
                  ),
                  isScrollControlled: true,
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.separated(
                itemBuilder: (ctx, i) => CreditCardTile(cardProvider[i]),
                separatorBuilder: (ctx, i) => SizedBox(
                      height: Sizes.horizontalMargin,
                    ),
                itemCount: cardProvider.length),
            ListView.separated(
                itemBuilder: (ctx, i) => UIDAITile(uidaiProvider[i]),
                separatorBuilder: (ctx, i) =>
                    SizedBox(height: Sizes.horizontalMargin),
                itemCount: uidaiProvider.length)
          ],
        ),
      ),
    );
  }
}
