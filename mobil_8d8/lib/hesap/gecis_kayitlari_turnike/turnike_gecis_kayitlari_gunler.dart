// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/gecis_kayitlari_yemekhane/gecis_yemekhane_components.dart';
import 'package:mobil_8d8/hesap/constant.dart';

class TurnikeGun extends StatefulWidget {
  final String aylar;
  final int kacinciAy;
  const TurnikeGun({super.key, required this.aylar, required this.kacinciAy});

  @override
  _TurnikeGunState createState() => _TurnikeGunState();
}

class _TurnikeGunState extends State<TurnikeGun> {
  bool onclick = true;

  int yil(int month, int year) {
    if (month > 6) {
      return year - 1;
    } else {
      return year;
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    late DateTime now = DateTime.now();
    late int year = now.year;
    late int daysInMonth =
        DateTime(yil(widget.kacinciAy, year), widget.kacinciAy + 1, 0).day;
    late int firstWeekdayOfMonth =
        DateTime(yil(widget.kacinciAy, year), widget.kacinciAy, 1).weekday;

    late List<Widget> dayWidgets = [];
    // Boş widgetlar ekleyerek ayın ilk gününü doğru konuma hizalayın
    for (int i = 1; i < firstWeekdayOfMonth; i++) {
      dayWidgets.add(bosgun(context));
    }
    // Pazar günlerini listeye ekle//////////////////////////////////////////
    late int gecisYapildi = 15;
    late List<int> devamsiz = [10, 2, 9, 3, 12, 17];
    late List<int> tatiller = [];

    for (int i = 1; i <= daysInMonth; i++) {
      DateTime currentDay =
          DateTime(yil(widget.kacinciAy, year), widget.kacinciAy, i);
      if (currentDay.weekday == DateTime.sunday ||
          currentDay.weekday == DateTime.saturday) {
        tatiller.add(currentDay.day);
      }
    }

///////////////////////////////////////////////////////

    for (int i = 1; i <= gecisYapildi; i++) {
      if (tatiller.contains(i)) {
        dayWidgets.add(
            gun(context, i, Colors.red[700]!, 'TATİL!', 'Bugün izinlisin!'));
        gecisYapildi = gecisYapildi + 1;
      } else if (devamsiz.contains(i) && !tatiller.contains(i)) {
        dayWidgets.add(gun(context, i, Colors.purple[700]!, 'DEVAMSIZ!',
            'Öğrenci bugün okula gelmedi!'));
        gecisYapildi = gecisYapildi + 1;
      } else {
        dayWidgets.add(gun(context, i, Colors.green[700]!, 'GEÇİŞ YAPILDI!',
            'Öğrenciniz okula giriş yaptı.'));
      }
    }
    for (int i = gecisYapildi + 1; i <= daysInMonth; i++) {
      if (tatiller.contains(i)) {
        dayWidgets.add(
            gun(context, i, Colors.red[700]!, 'TATİL!', 'Bugün izinlisin!'));
        gecisYapildi = gecisYapildi + 1;
      } else {
        dayWidgets.add(gun(context, i, Colors.white, 'HENÜZ BU GÜNE GELMEDİK!',
            'Bugün için herhangi bir bilgi bulunmamaktadır.'));
      }
    }

//////////////////////////////////////////////////////////////////////////////////
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.aylar} ${yil(widget.kacinciAy, year)}',
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    kisiHesabi(context),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          haftaText(context, 'Pzt'),
                          haftaText(context, 'Sal'),
                          haftaText(context, 'Çar'),
                          haftaText(context, 'Per'),
                          haftaText(context, 'Cum'),
                          haftaText(context, 'Cst'),
                          haftaText(context, 'Pzr'),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(1),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colors.black,
                          width: 1,
                        )))),
                    GridView.count(
                      crossAxisCount: 7,
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(
                          parent: RangeMaintainingScrollPhysics()),
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      children: dayWidgets,
                    ),
                    SizedBox(height: deviceHeight * 0.16)
                  ],
                ),
              ),
            ),
            Flexible(flex: 1, child: firma(context)),
          ],
        ),
      ),
    );
  }
}
