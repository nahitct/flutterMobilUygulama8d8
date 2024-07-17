// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap_ayari/uygulama_izinleri/kullanici_izni.dart';
import 'package:mobil_8d8/main_component.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const UygulamaIzinleri());
}

class UygulamaIzinleri extends StatelessWidget {
  const UygulamaIzinleri({super.key});

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
        home: const UygulamaIzni());
  }
}

class UygulamaIzni extends StatefulWidget {
  const UygulamaIzni({super.key});

  @override
  _UygulamaIzniState createState() => _UygulamaIzniState();
}

class _UygulamaIzniState extends State<UygulamaIzni> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('KULLANICI İZİNLERİ'),
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
                          padding: const EdgeInsets.fromLTRB(15, 15, 20, 15),
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
                                '   Okul Güvenliği uygulamasının düzgün çalışabilmesi için, "Bildirimler kısmından izinlerin verilmiş olması gerekiyor.\n\n'
                                '   Okul Güvenliği uygulamasını kullanarak, QR kod ile giriş-çıkış yapabilmek için, "Kamera" kullanım iznini vermeniz gerekiyor.\n\n'
                                '   Okul Güvenliği uygulaması, uygulama kapalı olsa da öğrencinin bilinen son konumunu harita üzerinde göstermek için konum verilerini toplar.\n\n'
                                '   Toplanan bu veriler, sadece izin verilen velilerle paylaşılmakta olup, velisi dışında herhangi bir kişinin öğrencinin konumuna erişmesi mümkün değildir.\n\n'
                                '   Takip listesinde Öğrenci olarak eklenmiş kimse bulunmayan cihazlarda, konum servisleri çalıştırılmaz.\n\n'
                                '   Konum işlemlerinin düzgün çalışabilmesi için, Okul Güvenliği uygulamasının konumunuza her zaman erişebilmesi için izin veriniz.\n\n'
                                '   Öğrencinin telefonunda, uygulama ayarlarından "Konum" izinlerini "Her Zaman İzin Ver" olarak ayarlamanız önerilir.\n\n',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey[800]!,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'Kullanım Koşulları - Gizlilik Sözleşmemizi ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.orange[900]!,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => launchUrlString(
                                      'https://www.okulguvenligi.com/sogip/privacy.html'),
                              ),
                              TextSpan(
                                text: 'Okuyunuz',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueGrey[900]!,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  overlayColor: Colors.yellow,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('ŞİMDİ DEĞİL'),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  overlayColor: Colors.yellow,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const KullaniciIzni()));
                                },
                                child: const Text('İZİNLERİ DÜZENLE'),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            )));
  }
}
