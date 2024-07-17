// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/gecis_kayitlari_yemekhane/gecis_yemekhane_components.dart';
import 'package:mobil_8d8/hesap/constant.dart';

class YemekhaneTurnikeGun extends StatefulWidget {
  final String aylar;
  final int kacinciAy;
  const YemekhaneTurnikeGun(
      {super.key, required this.aylar, required this.kacinciAy});

  @override
  _YemekhaneTurnikeGunState createState() => _YemekhaneTurnikeGunState();
}

class _YemekhaneTurnikeGunState extends State<YemekhaneTurnikeGun> {
  String _selectedMeal = "";
  void _onMealTap(String meal) {
    setState(() {
      _selectedMeal = meal;
    });
  }

  bool onclick = true;
  void onClicked() {
    setState(() {
      onclick = !onclick;
    });
  }

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
    late int kullanilmisGun = 7;
    late int kullanilabilirGun = 8;
    late List<int> tatiller = [];

    for (int i = 1; i <= daysInMonth; i++) {
      DateTime currentDay =
          DateTime(yil(widget.kacinciAy, year), widget.kacinciAy, i);
      if (currentDay.weekday == DateTime.sunday) {
        tatiller.add(currentDay.day);
      }
    }

///////////////////////////////////////////////////////

    for (int i = 1; i <= kullanilmisGun; i++) {
      if (tatiller.contains(i)) {
        dayWidgets.add(gun(
            context, i, Colors.red[700]!, 'TATİL!', 'Bugün yemek hakkı yok!'));
        kullanilmisGun = kullanilmisGun + 1;
      } else {
        dayWidgets.add(gun(context, i, Colors.purple[700]!,
            'YEMEK HAKKI KULLANILDI!', 'Afiyet olsun'));
      }
    }
    for (int i = kullanilmisGun + 1;
        i <= (kullanilmisGun + kullanilabilirGun);
        i++) {
      if (tatiller.contains(i)) {
        dayWidgets.add(gun(
            context, i, Colors.red[700]!, 'TATİL!', 'Bugün yemek hakkı yok!'));
        kullanilabilirGun = kullanilabilirGun + 1;
      } else {
        dayWidgets.add(gun(
            context,
            i,
            Colors.green[700]!,
            'KULLANILABİLİR YEMEK HAKKI TANIMLANDI!',
            'Bugün yemek hakkı kullanabilirsiniz.\n  Afiyet olsun..'));
      }
    }

    for (int i = (kullanilmisGun + kullanilabilirGun) + 1;
        i <= (daysInMonth);
        i++) {
      if (tatiller.contains(i)) {
        dayWidgets.add(gun(
            context, i, Colors.red[700]!, 'TATİL!', 'Bugün yemek hakkı yok!'));
      } else {
        dayWidgets.add(gun(context, i, Colors.white, 'TANIMLANMAMIŞ GÜN!',
            'Bugün için yemek hakkı tanımlanmamıştır.'));
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    kisiHesabi(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        yemeksaatiButton(
                            context, "Sabah", _selectedMeal, _onMealTap),
                        yemeksaatiButton(
                            context, "Öğle", _selectedMeal, _onMealTap),
                        yemeksaatiButton(
                            context, "Akşam", _selectedMeal, _onMealTap),
                        yemeksaatiButton(
                            context, "Ara Öğün", _selectedMeal, _onMealTap),
                      ],
                    ),
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
                    yemekFiyat(context, 'Yüklenen Gün Sayisi',
                        kullanilabilirGun + kullanilmisGun),
                    yemekFiyat(context, 'Uygulanan Birim Fiyat', 0.00),
                    bakiye(context, 'Bakiye', 0.00, onclick, onClicked),
                    if (!onclick)
                      bakiyeDetay(context, 'Açıklama', 0.00, now.toString()),
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
