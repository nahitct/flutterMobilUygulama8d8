// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mobil_8d8/hesap_ayari/hesap_ayari_component.dart';
import 'dart:async';

import 'package:mobil_8d8/hesap_ayari/onay_kodu_2.dart';
import 'package:mobil_8d8/hesap_ayari/uygulama_izinleri/uygulama_izni.dart';
import 'package:mobil_8d8/kisi_hesabi_giris.dart';
import 'package:mobil_8d8/main.dart';
import 'package:mobil_8d8/main_component.dart';
import 'package:mobil_8d8/save_json/user_info.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const HesapAyari());
}

class HesapAyari extends StatelessWidget {
  const HesapAyari({super.key});

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
        home: const HesapAyarlari());
  }
}

class HesapAyarlari extends StatefulWidget {
  const HesapAyarlari({super.key});

  @override
  _HesapAyarlariState createState() => _HesapAyarlariState();
}

class _HesapAyarlariState extends State<HesapAyarlari> {
  final _formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  int number = 0;

  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  late Future<AndroidDeviceInfo> _androidDeviceInfo;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HESAP AYARLARI'),
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
        child: Flexible(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        logo(context),
                        maintitle(context),
                        const SizedBox(height: 8),
                        hesapAyariText(context, 'Hesap Ayarları'),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: deviceWidth / 2,
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                "Adınız:",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blueGrey[900]!,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Soyadınız:",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blueGrey[900]!,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Cep Telefonu:\n (0 olmadan)",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blueGrey[900]!,
                                    fontWeight: FontWeight.w700),
                              ),
                            ]),
                      ),
                      Container(
                        width: deviceWidth / 2,
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            TextFormField(
                                // controller: lastNameController,
                                // onChanged: (value) => setState(() {
                                //   kayit.surname = value;
                                // }),
                                decoration: InputDecoration(
                              hintText: 'Mehmet',
                              border: const UnderlineInputBorder(),
                              hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.brown[800]!,
                                  fontWeight: FontWeight.w500),
                            )),
                            TextFormField(
                                // controller: lastNameController,
                                // onChanged: (value) => setState(() {
                                //   kayit.surname = value;
                                // }),
                                decoration: InputDecoration(
                              hintText: 'Söğünmez',
                              border: const UnderlineInputBorder(),
                              hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.brown[800]!,
                                  fontWeight: FontWeight.w500),
                            )),
                            TextFormField(
                                // controller: lastNameController,
                                // onChanged: (value) => setState(() {
                                //   kayit.surname = value;
                                // }),
                                decoration: InputDecoration(
                              hintText: '555 555 55 55',
                              border: const UnderlineInputBorder(),
                              hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.brown[800]!,
                                  fontWeight: FontWeight.w500),
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Diğer Bilgiler',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.yellow[800]!,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                    color: Colors.yellow[800]!,
                                    width: 3,
                                  )))),
                              Row(
                                children: [
                                  Container(
                                    width: (deviceWidth / 2) - 40,
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Hesap açılış tarihi:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey[900]!,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Uygulama Sürümü:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey[900]!,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "Cihaz Bilgileri:",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueGrey[900]!,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ]),
                                  ),
                                  Container(
                                    width: (deviceWidth / 2) - 40,
                                    padding:
                                        const EdgeInsets.fromLTRB(50, 18, 0, 0),
                                    child: Column(
                                      children: [
                                        // const SizedBox(height: 20),
                                        Text(
                                          "09/05/2024",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey[800]!,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          "10.0",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.blueGrey[800]!,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const SizedBox(height: 8),
                                        FutureBuilder(
                                          future: _androidDeviceInfo,
                                          builder: (context, snapshot) {
                                            // When future solves build text widget until
                                            // then show indefinite progress
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              // Retrieve AndroidDeviceInfo from future
                                              AndroidDeviceInfo info = snapshot
                                                  .data as AndroidDeviceInfo;
                                              return Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      info.manufacturer
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .blueGrey[800]!,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(
                                                      info.model.toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .blueGrey[800]!,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 60,
                    width: deviceWidth - 10,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor:
                                const Color.fromARGB(150, 255, 140, 0)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OnayKodu20()),
                          );
                        },
                        child: const Text('BİLGİLERİMİ GÜNCELLE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    height: 60,
                    width: deviceWidth - 10,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor:
                                const Color.fromARGB(150, 255, 140, 0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UygulamaIzni()));
                        },
                        child: const Text('UYGULAMA İZİNLERİNİ YENİLE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'HATIRLATMA',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey[900]!,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Colors.blueGrey[900]!,
                                  width: 3,
                                )))),
                            const SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                              text:
                                  '   Yeni bir telefon numarası girerseniz, eski numaranız ile hesap açtığınız başka cihazlar var ise o cihazlar üzerindeki oturumlarınız kapatılacaktır.\n\n'
                                  '   Güncelleme işleminin uygulanması için cep telefonu numarasına gelecek olan 4 haneli onay kodunu girmeniz gerekmektedir. Yeni bir telefon numarası girilmiş ise, onay kodu yeni girilen numaraya gönderilecektir.',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueGrey[900]!,
                                  fontWeight: FontWeight.bold),
                            )),
                            const SizedBox(height: 10),
                            Container(
                                padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Colors.blueGrey[900]!,
                                  width: 2,
                                )))),
                            const SizedBox(height: 10),
                            RichText(
                                text: TextSpan(
                              text:
                                  '   Çıkış yapıldıktan sonra kayıt sayfası üzerinden yeniden hesap oluşturabilirsiniz. Mevcut cep telefonu numaranız ile kayıt olmanız halinde güncel takip listeniz kullanılabilir olacaktır.\n\n'
                                  '   Hesap Silme işleminin uygulanması için cep telefonu numarasına gelecek olan 4 haneli onay kodunu girmeniz gerekmektedir.',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.blueGrey[900]!,
                                  fontWeight: FontWeight.bold),
                            )),
                          ])),
                  SizedBox(height: deviceHeight / 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    width: deviceWidth - 10,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor:
                                const Color.fromARGB(150, 255, 140, 0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OkulGuvenligiPage(
                                    user: User(
                                        name: '', surname: '', number: '')),
                              ));
                        },
                        child: const Text('ÇIKIŞ YAP',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    width: deviceWidth - 10,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: const Color(0xFF4567b7)),
                        onPressed: () {
                          launchUrlString(
                              'https://www.okulguvenligi.com/sogip/privacy.html');
                        },
                        child: const Text('KULLANICI SÖZLEŞMESİ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    width: deviceWidth - 10,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            backgroundColor: const Color(0xFF4567b7)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Giris(),
                              ));
                        },
                        child: const Text('ANA SAYFAYA GERİ DÖN',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: deviceWidth,
                    height: 40,
                    color: Colors.blueAccent[300],
                    child: const FittedBox(
                      child: Text(
                        '® Sekizdesekiz Grup',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _androidDeviceInfo = _deviceInfoPlugin.androidInfo;
    super.initState();
  }
}
