import 'package:flutter/cupertino.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneratorService {

  static generateUri({
    required VoidCallback onGenerateSuccess,
    required String code,
    required String holder,

    String vaccineType = 'Johnson&Johnson'
  }) async {

    String walletUriScheme = FlutterConfig.get('WALLET_URI_SCHEME');
    String walletUriHost = FlutterConfig.get('WALLET_URI_HOST');
    String walletUriPath = FlutterConfig.get('WALLET_URI_PATH');

    if (walletUriScheme.isEmpty || walletUriScheme.length == 0) throw new Exception('Missing WALLET_URI_SCHEME parameter!');
    if (walletUriHost.isEmpty || walletUriHost.length == 0) throw new Exception('Missing WALLET_URI_HOST parameter!');
    if (walletUriPath.isEmpty || walletUriPath.length == 0) throw new Exception('Missing WALLET_URI_PATH parameter!');

    final Uri walletUri = Uri(
        scheme: walletUriScheme,
        host: walletUriHost,
        path: walletUriPath,
        queryParameters: {
          'code': code,
          'holder': holder,
          'vaccineType': vaccineType
        }
    );

    try {
      await launch(walletUri.toString(), forceWebView: true, universalLinksOnly: true, statusBarBrightness: Brightness.dark);
    } catch(e) {
      // print('Error');
    } finally {
      onGenerateSuccess();
    }
  }

}