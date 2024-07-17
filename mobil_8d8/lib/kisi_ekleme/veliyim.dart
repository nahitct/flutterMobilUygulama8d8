// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/constant.dart';
import 'package:mobil_8d8/kisi_ekleme/kisi_ekle_component.dart';
import 'package:mobil_8d8/kisi_hesabi_giris.dart';

void main() {
  runApp(const Veli());
}

class Veli extends StatelessWidget {
  const Veli({super.key});

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
        home: const Veliyim());
  }
}

class Veliyim extends StatefulWidget {
  const Veliyim({super.key});
  @override
  _VeliyimState createState() => _VeliyimState();
}

class _VeliyimState extends State<Veliyim> {
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

        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            userEkle(context),
                            userConnectCard(
                              whosePhone: "Numaraya bağlı kişiler:",
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
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                  children: [homePageButton(context, () => const Giris())]),
            ),
            Expanded(
              flex: 1,
              child: Stack(children: [firma(context)]),
            ),
            // Expanded(
            //   flex: 1,
            //   child: firma(context),
            // ),
          ],
        ),
      ),
    );
  }
}
