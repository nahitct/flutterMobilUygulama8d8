// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/bildirimler_duyurular/bildirim_ayarlari.dart';
import 'package:mobil_8d8/hesap/gecis_kayitlari_turnike/turnike.dart';
import 'package:mobil_8d8/hesap/gecis_kayitlari_yemekhane/yemekhane.dart';
import 'package:mobil_8d8/hesap/bildirimler_duyurular/bildirim.dart';
import 'package:mobil_8d8/hesap/bildirimler_duyurular/duyuru.dart';
import 'package:mobil_8d8/hesap/buttons_selection.dart';
import 'package:mobil_8d8/hesap/constant.dart';
import 'package:mobil_8d8/hesap/karekod_kullan/karekod.dart';
import 'package:mobil_8d8/hesap_ayari/hesap_ayarlari.dart';

class Hesap extends StatelessWidget {
  const Hesap({super.key});

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
        home: const MainMenu());
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            kisiHesabi(context),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                menuButton(context, () => const Announcements(), 'DUYURULAR',
                    Icons.local_post_office),
                menuButton(context, () => const Notifications(), 'BİLDİRİMLER',
                    Icons.notifications_active),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                menuButton(context, () => const TurnikeAylar(),
                    'GEÇİŞ KAYITLARI', Icons.transfer_within_a_station),
                menuButton(context, () => const YemekhaneTurnike(), 'YEMEKHANE',
                    Icons.food_bank),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                menuButton(context, () => const NotificationsSettings(),
                    'BİLDİRİM AYARLARI', Icons.phonelink_ring),
                menuButton(context, () => const QrCode(), 'KAREKOD KULLAN',
                    Icons.qr_code_scanner),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                menuButton(context, () => const Testing(),
                    'DEVAMSIZLIK BİLGİSİ', Icons.rate_review),
                menuButton(context, () => const HesapAyarlari(),
                    'HESAP AYARLARI', Icons.manage_accounts),
              ],
            ),
            firma(context),
          ],
        ),
      ),
    );
  }
}
