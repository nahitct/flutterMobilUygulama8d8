// ignore_for_file: library_private_types_in_public_api

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:mobil_8d8/kisi_hesabi_giris.dart';
import 'package:mobil_8d8/main_component.dart';

void main() {
  runApp(const KullaniciIzinleri());
}

class KullaniciIzinleri extends StatelessWidget {
  const KullaniciIzinleri({super.key});

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
        home: const KullaniciIzni());
  }
}

class KullaniciIzni extends StatefulWidget {
  const KullaniciIzni({super.key});

  @override
  _KullaniciIzniState createState() => _KullaniciIzniState();
}

class _KullaniciIzniState extends State<KullaniciIzni> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('KULLANICI İZİNLERİ'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),
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
                  Colors.grey[600]!,
                  Colors.grey[500]!,
                  Colors.blueGrey[700]!,
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
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: Column(
                            children: [
                              logo(context),
                              maintitle(context),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: RichText(
                              text: TextSpan(
                            text:
                                '   Öğrencinin telefonunda konum işlemlerini kullanabilmek için "Konum" izinlerini açmanız gerekmektedir.\n\n'
                                '   Uygulama ayarlarından, "Konum" yetkisini "Her Zaman İzin Ver" yaparak konum işlemlerinin sorunsuz çalışmasını sağlayabilirsiniz.\n\n'
                                '   Uygulamaya ait diğer izinlerin yönetimini de "Ayarlar" butonuna tıklayarakdüzenleyebilirsiniz.\n\n',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey[800]!,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          height: 60,
                          width: deviceWidth - 10,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  backgroundColor: const Color(0xFF4567b7)),
                              onPressed: () {
                                openSettings();
                              },
                              child: const Text('AYARLAR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))),
                        ),
                        Container(
                          height: 60,
                          width: deviceWidth - 10,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                      ]),
                ),
              ),
            )));
  }
}

Future<void> openSettings() async {
  await AppSettings.openAppSettings();
}
