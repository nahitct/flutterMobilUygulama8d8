// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/gecis_kayitlari_yemekhane/gecis_yemekhane_components.dart';
import 'package:mobil_8d8/hesap/constant.dart';

class TurnikeAylar extends StatefulWidget {
  const TurnikeAylar({super.key});

  @override
  _TurnikeAylarState createState() => _TurnikeAylarState();
}

class _TurnikeAylarState extends State<TurnikeAylar> {
  late DateTime now = DateTime.now();
  late int year = now.year;
  late int month = now.month;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TURNİKE GEÇİŞ KAYITLARI"),
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
            kisiHesabi(context),
            gecisKayitlariDonemText(context, yilHesapla(month, year)),
            gecisTurnikebox(context, "TEMMUZ", "AĞUSTOS", 7, 8),
            gecisTurnikebox(context, "EYLÜL", "EKİM", 9, 10),
            gecisTurnikebox(context, "KASIM", "ARALIK", 11, 12),
            gecisTurnikebox(context, "OCAK", "ŞUBAT", 1, 2),
            gecisTurnikebox(context, "MART", "NİSAN", 3, 4),
            gecisTurnikebox(context, "MAYIS", "HAZİRAN", 5, 6),
            firma(context),
          ],
        ),
      ),
    );
  }
}
