import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/constant.dart';
import 'package:mobil_8d8/hesap/karekod_kullan/karekod_component.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("KAREKODUYLA GİRİŞ"),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kisiHesabi(context),
              karekodResmi(context, 'lib/assets/images/qr_in.png'),
              karekodButton(
                  context, 'GİRİŞ KAREKODU', Colors.greenAccent[700]!, 0),
              karekodResmi(context, 'lib/assets/images/qr_out.png'),
              karekodButton(
                  context, 'ÇIKIŞ KAREKODU', Colors.redAccent[700]!, 1),
              firma(context)
            ],
          )),
    );
  }
}
