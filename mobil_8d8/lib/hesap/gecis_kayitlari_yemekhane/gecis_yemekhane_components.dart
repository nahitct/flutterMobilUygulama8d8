import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/gecis_kayitlari_turnike/turnike_gecis_kayitlari_gunler.dart';
import 'package:mobil_8d8/hesap/gecis_kayitlari_yemekhane/yemekhane_gecis_kayitlari_gunler.dart';

Widget aylarButton(
  BuildContext context,
  Function sayfa,
  String aylar,
) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => sayfa(),
          ));
    },
    child: Container(
      width: (deviceWidth / 2) - 20,
      height: deviceHeight / 12,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.cyan[700],
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            aylar,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget gecisKayitlariDonemText(BuildContext context, var year) {
  return Text(
    "$year DÖNEMİ AYLIK GEÇİŞ",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 20,
      color: Colors.lime[600]!,
      fontWeight: FontWeight.w700,
    ),
  );
}

// String birAy, String ikiAy,
Widget gecisbox(
  BuildContext context,
  String birAy,
  String ikiAy,
  int birinciAy,
  int ikinciAy,
) {
  return Flexible(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        aylarButton(
            context,
            () => YemekhaneTurnikeGun(aylar: birAy, kacinciAy: birinciAy),
            birAy),
        aylarButton(
            context,
            () => YemekhaneTurnikeGun(aylar: ikiAy, kacinciAy: ikinciAy),
            ikiAy),
      ],
    ),
  );
}

Widget gecisTurnikebox(
  BuildContext context,
  String birAy,
  String ikiAy,
  int birinciAy,
  int ikinciAy,
) {
  return Flexible(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        aylarButton(context,
            () => TurnikeGun(aylar: birAy, kacinciAy: birinciAy), birAy),
        aylarButton(context,
            () => TurnikeGun(aylar: ikiAy, kacinciAy: ikinciAy), ikiAy),
      ],
    ),
  );
}

String yilHesapla(int month, int year) {
  int year2;
  if (month > 6) {
    year2 = year + 1;
    return '$year - $year2';
  } else {
    year2 = year - 1;
    return '$year2 - $year';
  }
}

Widget yemeksaatiButton(
  BuildContext context,
  // Function sayfa,
  String ogunler,
  String selectedMeal,
  Function onMealTap,
) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      onMealTap(ogunler);
    },
    child: Container(
      width: (deviceWidth / 4) - 12,
      height: deviceHeight / 20,
      decoration: BoxDecoration(
        color: selectedMeal == ogunler ? Colors.orange[900] : Colors.cyan[700],
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            ogunler,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget bosgun(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: (deviceWidth / 7) - 14,
    height: (deviceWidth / 7) - 14,
  );
}

Widget gun(
    BuildContext context, int i, Color color, String title, String content) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Kapat'),
                ),
              ],
            );
          });
    },
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        i.toString(),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget haftaText(BuildContext context, String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

Widget yemekFiyat(BuildContext context, String text, dynamic sayi) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$text:'),
        Text(
          sayi is int ? '$sayi' : sayi.toStringAsFixed(2),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget bakiye(BuildContext context, String text, double sayi, bool onclick,
    VoidCallback onClicked) {
  return GestureDetector(
    onTap: onClicked,
    child: Container(
      color: Colors.grey[700],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$text:'),
                IconButton(
                  onPressed: onClicked,
                  icon: Icon(
                    onclick
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                  ),
                ),
                Text(
                  'TOPLAM : ${sayi.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget bakiyeDetay(
    BuildContext context, String text, double sayi, String tarih) {
  double deviceWidth = MediaQuery.of(context).size.width;
  return Column(
    children: [
      Container(
        width: deviceWidth,
        color: Colors.grey[800],
        child: Text('Tarih :  $tarih'),
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '# İŞLEM',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'TUTAR',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'BAKİYE',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Container(
          padding: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.black,
            width: 1,
          )))),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$text:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            sayi.toStringAsFixed(2),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            sayi.toStringAsFixed(2),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  );
}
