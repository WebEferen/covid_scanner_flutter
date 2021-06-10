import 'package:flutter/cupertino.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_wallet_card/flutter_wallet_card.dart';

class GeneratorService {

  static generateUri({
    Function(dynamic error)? onGenerateFailed,
    VoidCallback? onGenerateSuccess,
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
      final bool isCardGenerated = await FlutterWalletCard.createPassFromUri(
          scheme: walletUri.scheme,
          host: walletUri.host,
          path: walletUri.path,
          parameters: walletUri.queryParameters
      );

      return isCardGenerated ? onGenerateSuccess!() : onGenerateFailed!(Exception('Generation Failed'));
    } catch(e) {
      onGenerateFailed!(e);
    }
  }

}