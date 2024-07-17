// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/constant.dart';
import 'package:mobil_8d8/hesap/hesap.dart';
import 'package:mobil_8d8/hesap_ayari/hesap_ayarlari.dart';
import 'package:mobil_8d8/kisi_ekleme/kisi_ekle.dart';
import 'package:mobil_8d8/kisi_hesabi_giris_component.dart';
import 'package:mobil_8d8/main_component.dart';

void main() {
  runApp(const KisiHesabiGiris());
}

class KisiHesabiGiris extends StatelessWidget {
  const KisiHesabiGiris({super.key});

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
        home: const Giris());
  }
}

class Giris extends StatefulWidget {
  const Giris({super.key});

  @override
  _GirisState createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  final _formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        // width: double.infinity,
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    logo(context),
                    maintitle(context),
                    Text(
                      ' Kişi Listesi ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blueGrey[900]!,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: deviceWidth,
                      height: deviceHeight / 2.2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            cardWidget(context, () => const Hesap()),
                            cardWidget(context, () => const Hesap()),
                            cardWidget(context, () => const Hesap()),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    girisButton(context, () => const KisiEkle(), 'KİŞİ EKLE'),
                    const SizedBox(height: 10),
                    girisButton(
                        context, () => const HesapAyarlari(), 'HESAP AYARLARI')
                  ],
                ),
              ),
            ),
            firma(context)
          ],
        ),
      ),
    );
  }
}
