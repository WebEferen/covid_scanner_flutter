import 'package:covid_scanner/models/route_arguments.dart';
import 'package:covid_scanner/screens/information.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:covid_scanner/widgets/page_scaffold.dart';
import 'package:covid_scanner/widgets/qrscanner.dart';

class ScannerPage extends StatefulWidget {
  static final pageName = 'scanner';
  final String title;

  const ScannerPage({Key? key, required this.title}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState(title: this.title);
}

class _ScannerPageState extends State<ScannerPage> {
  final String title;

  _ScannerPageState({ required this.title });

  _handleCodeScan(Barcode data) {
    // TODO: When the credentials for Base64/JWT decode would be fulfilled here we can decode existing token to extract key information.
    // TODO: Also it would be beneficial to omit next page (information step).
    Navigator.pushReplacementNamed(context, InformationPage.pageName, arguments: RouteArguments(code: data.code.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
        title: title,
        padding: EdgeInsets.zero,
        backgroundColor: CupertinoColors.black,
        child: new Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: QrScanner(onScanResult: (data) => _handleCodeScan(data)))
    );
  }
}
