// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/constant.dart';
import 'package:mobil_8d8/kisi_ekleme/kisi_ekle_component.dart';
import 'package:mobil_8d8/kisi_hesabi_giris.dart';

void main() {
  runApp(const Ogrenci());
}

class Ogrenci extends StatelessWidget {
  const Ogrenci({super.key});

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
        home: const Ogrenciyim());
  }
}

class Ogrenciyim extends StatefulWidget {
  const Ogrenciyim({super.key});
  @override
  _OgrenciyimState createState() => _OgrenciyimState();
}

class _OgrenciyimState extends State<Ogrenciyim> {
  final numberController = TextEditingController();
  int number = 0;
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

        child: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 12,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: deviceWidth,
                      height: deviceHeight -
                          kBottomNavigationBarHeight -
                          MediaQuery.of(context).viewInsets.bottom,
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          userConnectCard(
                            whosePhone: "Öğrencinin Veli Telefonunu Giriniz:",
                            context,
                            controller: numberController,
                            hintText: '5XX XXX XXXX',
                            onChanged: (value) => setState(() {
                              number = int.parse(value);
                            }),
                            keyboardType: TextInputType.phone,
                            number: number,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
