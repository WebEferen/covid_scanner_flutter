import 'package:covid_scanner/services/translation.service.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

import 'package:covid_scanner/screens/scanner.page.dart';
import 'package:covid_scanner/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';


class InitPage extends StatefulWidget {
  static final pageName = '/';
  final String title;

  InitPage({Key? key, required this.title}) : super(key: key);

  @override
  _InitPage createState() => _InitPage(title: this.title);
}

class _InitPage extends State<InitPage> {
  final String title;
  bool isPermissionDenied = false;

  _InitPage({ required this.title });

  Future<void> _handlePress(BuildContext context) async {
      Navigator.of(context).restorablePushNamed(ScannerPage.pageName);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle greenStyle = TextStyle(
      color: CupertinoColors.activeGreen,
      fontWeight: FontWeight.bold,
      fontSize: 20
    );

    return PageScaffold(
        title: title,
        navigationBarEnabled: false,
        backgroundColor: CupertinoColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container(
              child: Column(mainAxisAlignment: MainAxisAlignment.center ,children: [
                Image(width: 0.5 * MediaQuery.of(context).size.width, image: AssetImage('assets/images/logo.png')),
                SizedBox(height: 30),
                Text(TranslationService.getTranslation('european_union'), style: greenStyle),
                Text(TranslationService.getTranslation('covid_certificate'), style: greenStyle)
              ]),
              alignment: Alignment.center,
            )),
            CupertinoButton(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(TranslationService.getTranslation('get_started_button'),
                          style: TextStyle(color: CupertinoColors.black, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Icon(CupertinoIcons.right_chevron)
                    ]
                ),
                alignment: Alignment.center,
              ),
              onPressed: () => this._handlePress(context),
              borderRadius: BorderRadius.circular(10),
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
              pressedOpacity: 0.8,
              color: CupertinoColors.white,
            ),
            SizedBox(height: 20)
          ],
    ));
  }
}
