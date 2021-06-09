import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';

import 'package:covid_scanner/services/translation.service.dart';
import 'package:covid_scanner/screens/information.page.dart';
import 'package:covid_scanner/screens/scanner.page.dart';
import 'package:covid_scanner/screens/init.page.dart';

void main() async {
  // TODO: Can be moved onto the external translation service such as Contentful (headless)
  TranslationService.setTranslations(Map.fromEntries([
    MapEntry('app_title', 'EU Covid Certificate'),
    MapEntry('scan_qr_code', 'Scan the QR code'),
    MapEntry('holder_name_label', 'Holder name:'),
    MapEntry('vaccine_type_label', 'Vaccine type:'),
    MapEntry('generate_certificate_button', 'Generate the certificate'),
    MapEntry('get_started_button', 'Get started'),
    MapEntry('european_union', 'EUROPEAN UNION'),
    MapEntry('covid_certificate', 'Covid Certificate')
  ]));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  await FlutterConfig.loadEnvVariables();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: TranslationService.getTranslation('app_title'),
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        barBackgroundColor: CupertinoColors.white,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.black
        )
      ),
      initialRoute: InitPage.pageName,
      routes: {
        InitPage.pageName: (_) => new InitPage(title: TranslationService.getTranslation('app_title')),
        ScannerPage.pageName: (_) => new ScannerPage(title: TranslationService.getTranslation('scan_qr_code')),
        InformationPage.pageName: (_) => new InformationPage(title: TranslationService.getTranslation('app_title'))
      }
    );
  }
}