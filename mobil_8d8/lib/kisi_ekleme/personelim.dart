// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/constant.dart';
import 'package:mobil_8d8/kisi_ekleme/kisi_ekle_component.dart';
import 'package:mobil_8d8/kisi_hesabi_giris.dart';

void main() {
  runApp(const Personel());
}

class Personel extends StatelessWidget {
  const Personel({super.key});

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
        home: const Personelim());
  }
}

class Personelim extends StatefulWidget {
  const Personelim({super.key});

  @override
  _PersonelimState createState() => _PersonelimState();
}

class _PersonelimState extends State<Personelim> {
  final _formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('TAKİP LİSTESİNE EKLE'),
      ),
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
            Flexible(
              flex: 12,
              child: Container(
                width: deviceWidth,
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        width: deviceWidth,
                        height: deviceHeight / 1.8,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              userEkle(context),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
