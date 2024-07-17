// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/gecis_kayitlari_yemekhane/gecis_yemekhane_components.dart';
import 'package:mobil_8d8/hesap/constant.dart';

class YemekhaneTurnike extends StatefulWidget {
  const YemekhaneTurnike({super.key});

  @override
  _YemekhaneTurnikeState createState() => _YemekhaneTurnikeState();
}

class _YemekhaneTurnikeState extends State<YemekhaneTurnike> {
  late DateTime now = DateTime.now();
  late int year = now.year;
  late int month = now.month;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("YEMEKHANE İŞLEMLERİ"),
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
            gecisbox(
              context,
              "TEMMUZ",
              "AĞUSTOS",
              7,
              8,
            ),
            gecisbox(context, "EYLÜL", "EKİM", 9, 10),
            gecisbox(context, "KASIM", "ARALIK", 11, 12),
            gecisbox(context, "OCAK", "ŞUBAT", 1, 2),
            gecisbox(context, "MART", "NİSAN", 3, 4),
            gecisbox(context, "MAYIS", "HAZİRAN", 5, 6),
            firma(context),
          ],
        ),
      ),
    );
  }
}
