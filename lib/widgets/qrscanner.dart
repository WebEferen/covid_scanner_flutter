import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  final Function(Barcode scanData) onScanResult;

  const QrScanner({ Key? key, required this.onScanResult }) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState(onScanResult: this.onScanResult);
}

class _QrScannerState extends State<QrScanner> {
  final Function(Barcode scanData) onScanResult;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;
  QRViewController? controller;

  _QrScannerState({ required this.onScanResult });

  @override
  Widget build(BuildContext context) {
    return _buildQrView(context);
  }

  @override
  void reassemble() {
    super.reassemble();
    (Platform.isAndroid) ? this.controller!.pauseCamera() : controller!.resumeCamera();
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: CupertinoColors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((scanData) {
      controller.dispose();
      this.onScanResult(scanData);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
