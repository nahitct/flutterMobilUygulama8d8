import 'package:flutter/material.dart';

Widget menuButton(
    BuildContext context, Function sayfa, String sayfaIsmi, IconData icon) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => sayfa(),
        ),
      );
    },
    child: Container(
      width: deviceWidth / 2 - 20,
      height: deviceHeight / 6,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: const Color(0xff1a2b4a),
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          IconButton(
            iconSize: 50,
            icon: Icon(icon),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => sayfa(),
                ),
              );
            },
          ),
          Text(
            sayfaIsmi,
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
