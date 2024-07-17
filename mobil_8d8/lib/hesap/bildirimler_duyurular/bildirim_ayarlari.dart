import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/bildirimler_duyurular/bildirimler_component.dart';
import 'package:mobil_8d8/hesap/constant.dart';

class NotificationsSettings extends StatefulWidget {
  const NotificationsSettings({super.key});

  @override
  State<NotificationsSettings> createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  bool switched1 = false;
  bool switched2 = false;
  bool switched3 = false;
  bool switched4 = false;
  bool switched5 = false;
  void _onSwitched1() {
    setState(() {
      switched1 = !switched1;
    });
  }

  void _onSwitched2() {
    setState(() {
      switched2 = !switched2;
    });
  }

  void _onSwitched3() {
    setState(() {
      switched3 = !switched3;
    });
  }

  void _onSwitched4() {
    setState(() {
      switched4 = !switched4;
    });
  }

  void _onSwitched5() {
    setState(() {
      switched5 = !switched5;
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("BİLDİRİM AYARLARI"),
      ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kisiHesabi(context),
              Container(
                height: deviceHeight * 0.60,
                width: deviceWidth,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bildirimAyarlari(context, 'Her Girişte Bildirim',
                        _onSwitched1, switched1),
                    bildirimAyarlariText(context,
                        'Öğrencinin kuruma her girişinde bildirim alırsınız.'),
                    bildirimAyarlari(context, 'Geç Girişte Bildirim',
                        _onSwitched2, switched2),
                    bildirimAyarlariText(context,
                        'Öğrencinin kuruma geç girişinde bildirim alırsınız.'),
                    bildirimAyarlari(context, 'Her Çıkışta Bildirim',
                        _onSwitched3, switched3),
                    bildirimAyarlariText(context,
                        'Öğrencinin kuruma her çıkışında bildirim alırsınız.'),
                    bildirimAyarlari(context, 'Erken Çıkışta Bildirim',
                        _onSwitched4, switched4),
                    bildirimAyarlariText(context,
                        'Öğrencinin kurumdan erken çıkışında bildirim alırsınız.'),
                    bildirimAyarlari(context, 'Gelmediğinde Bildirim',
                        _onSwitched5, switched5),
                    bildirimAyarlariText(context,
                        'Öğrencinin kuruma gelmediğinde bildirim alırsınız.'),
                  ],
                ),
              ),
              firma(context)
            ],
          )),
    );
  }
}
