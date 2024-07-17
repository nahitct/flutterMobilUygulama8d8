import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/constant.dart';
import 'package:mobil_8d8/hesap/karekod_kullan/karekod_component.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScaning extends StatefulWidget {
  final int inOrOut;

  const QrCodeScaning({super.key, required this.inOrOut});

  @override
  State<QrCodeScaning> createState() => _QrCodeScaningState();
}

class _QrCodeScaningState extends State<QrCodeScaning> {
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  String qrText = '';

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final now = DateTime.now();
    final year = now.year;
    final day = now.day;
    final month = now.month;
    const initialSeconds = 15;

    return Scaffold(
      appBar: AppBar(
        title: Text('$day/$month/$year'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Text(
            '9.11 | Okul Güvenliği',
            style: TextStyle(fontSize: 12, color: Colors.amber[50]),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[600]!,
              Colors.grey[500]!,
              Colors.blueGrey[700]!,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            qrScaningInOrOutText(context, widget.inOrOut),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            SizedBox(
              width: deviceWidth - 40,
              height: deviceHeight * 0.6,
              child: Stack(
                children: <Widget>[
                  QRView(
                    overlay: QrScannerOverlayShape(borderColor: Colors.black),
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Icon(
                        Icons.qr_code,
                        size: 200.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            qrCloseButton(context, 'KAPAT', initialSeconds),
            firma(context),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          qrText = scanData.code!;
        });
        if (kDebugMode) {
          print('Scanned data: ${scanData.code}');
        }
        // Handle the scanned data as desired
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
