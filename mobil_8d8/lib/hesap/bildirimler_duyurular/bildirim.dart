import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/bildirimler_duyurular/bildirimler_component.dart';
import 'package:mobil_8d8/hesap/constant.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    List<String> bildirimlerListesi = [
      "Sevgili personelimiz MEHMET SÖĞÜNMEZ",
      "Sevgili personelimiz MEHMET SÖĞÜNMEZ",
      "Sayin velimiz ogrenciniz MEHMET SOGUNMEZ",
      "Sevgili personelimiz MEHMET SOGUNMEZ",
      "Sevgili personelimiz MEHMET SOGUNMEZ",
      "Sevgili personelimiz MEHMET SOGUNMEZ",
      "Sevgili personelimiz MEHMET SOGUNMEZ",
    ];
    List<String> tarihListesi = [
      " 08:00 itibariyle kuruma giriş yaptınız. Hoş Geldiniz.",
      " 18:00 itibariyle kurumdan çıkış yaptınız. Görüşmek Üzere.",
      " 12:33 itibariyle okulumuza giris yapmamis gozukmektedir. Bilginize.",
      "saat 08:22 itibariyle kuruma gec olarak giris yaptiniz...",
      "saat 08:05 itibariyle kuruma giris yapmadiniz...",
      "saat 08:05 itibariyle kuruma giris yapmadiniz...",
      "saat 08:05 itibariyle kuruma giris yapmadiniz...",
    ];
    List<String> gonderimzamani = [
      "Gönderim Zamanı: 16.05.2024 08:01:18",
      "Gönderim Zamani: 15.05.2024 17:58:46",
      "Gönderim Zamanı: 15.05.2024 12:33:45",
      "Gönderim Zamanı: 15.05.2024 12:29:17",
      "Gönderim Zamanı: 15.05.2024 08:22:57",
      "Gönderim Zamanı: 15.05.2024 08:22:57",
      "Gönderim Zamanı: 15.05.2024 08:22:57",
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("BİLDİRİMLER"), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.mark_chat_read),
          onPressed: () {
            tumunuOkuSil(context, "Tümünü Okundu Yap", "");
          },
          tooltip: 'Tümünü Okundu Yap',
        ),
        IconButton(
          icon: const Icon(Icons.restore_from_trash_rounded),
          onPressed: () {
            tumunuOkuSil(context, "Tümünü Sil", "");
          },
          tooltip: 'Tümünü Sil',
        ),
      ]),
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
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              //    Bildirimler(
              //   bildirimlerListesi: widget.bildirimlerListesi,
              //   tarihListesi: widget.tarihListesi,
              //   gonderimZamani: widget.gonderimZamani,
              // ),
              kisiHesabi(context),
              bildirimDuyuru(context, bildirimlerListesi, tarihListesi,
                  gonderimzamani, Icons.local_post_office_rounded),
            ],
          )),
    );
  }
}
