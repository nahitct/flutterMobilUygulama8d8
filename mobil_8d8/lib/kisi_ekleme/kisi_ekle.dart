// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/constant.dart';
import 'package:mobil_8d8/kisi_ekleme/kisi_ekle_component.dart';
import 'package:mobil_8d8/kisi_ekleme/ogrenciyim.dart';
import 'package:mobil_8d8/kisi_ekleme/personelim.dart';
import 'package:mobil_8d8/kisi_ekleme/veliyim.dart';
import 'package:mobil_8d8/kisi_hesabi_giris.dart';
import 'package:mobil_8d8/kisi_hesabi_giris_component.dart';
import 'package:mobil_8d8/main_component.dart';

void main() {
  runApp(const Kisiler());
}

class Kisiler extends StatelessWidget {
  const Kisiler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.white,
              brightness: Brightness.dark,
              // ignore: deprecated_member_use
              background: Colors.grey[800]!),
        ),
        home: const KisiEkle());
  }
}

class KisiEkle extends StatefulWidget {
  const KisiEkle({super.key});

  @override
  _KisiEkleState createState() => _KisiEkleState();
}

class _KisiEkleState extends State<KisiEkle> {
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        //  width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[800]!,
              Colors.grey[500]!,
              Colors.blueGrey[900]!,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Flexible(
                flex: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    logo(context),
                    maintitle(context),
                    kisiListText(context),
                    SizedBox(
                      width: deviceWidth,
                      height: deviceHeight * 0.575,
                      child: Column(
                        children: [
                          kisiEkleCard(
                              context,
                              () => const Ogrenciyim(),
                              'ÖĞRENCİYİM',
                              "Kuruma öğrenci girişi veya çıkışı yapmak üzere karekod üretmek için kayıt ekler (Velinin SMS onayı gerekir)."),
                          kisiEkleCard(
                              context,
                              () => const Personelim(),
                              'PERSONELİM',
                              "Kuruma personel girişi veya çıkışı yapmak üzere karekod üretmek için kayıt ekler."),
                          kisiEkleCard(
                              context,
                              () => const Veliyim(),
                              'VELİYİM',
                              "Velisi olduğunuz öğrencinin giriş ve çıkış kayıtlarını incelemek için kayıt ekler."),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: homePageButton(context, () => const Giris()),
            ),
            Flexible(
              flex: 1,
              child: firma(context),
            ),
          ],
        ),
      ),
    );
  }
}
