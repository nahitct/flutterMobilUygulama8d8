import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/karekod_kullan/karekod_tarama.dart';
import 'package:timer_count_down/timer_count_down.dart';

Widget karekodResmi(BuildContext context, String dosya) {
  return Center(
    child: Image.asset(
      dosya,
      width: 170,
      height: 170,
    ),
  );
}

Widget karekodButton(
    BuildContext context, String buttontext, Color color, int inOrOut) {
  double deviceWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    height: 40,
    width: deviceWidth - 20,
    child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QrCodeScaning(
                  inOrOut: inOrOut,
                ),
              ));
        },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: color,
        ),
        child: Text(
          buttontext,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.amber[50]),
        )),
  );
}

Widget qrScaningInOrOutText(BuildContext context, int inOrOut) {
  return Text(
      inOrOut == 0
          ? 'Kuruma Giriş Karekodu'
          : inOrOut == 1
              ? 'Kurumdan Çıkış Karekodu'
              : '',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: inOrOut == 0 ? Colors.greenAccent[700] : Colors.redAccent[700],
      ));
}

Widget qrCloseButton(
    BuildContext context, String buttontext, int initialSeconds) {
  double deviceWidth = MediaQuery.of(context).size.width;

  return Countdown(
      seconds: initialSeconds,
      build: (BuildContext context, double time) {
        if (time.round() > 0) {
          return SizedBox(
            height: 40,
            width: deviceWidth - 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFF4567b7),
              ),
              child: Text(
                '$buttontext(${time.round()})',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.amber[50],
                ),
              ),
            ),
          );
        } else {
          Navigator.pop(context);
          return const SizedBox.shrink();
        }
      });
}
