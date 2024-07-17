import 'package:flutter/material.dart';

Widget hesapAyariText(BuildContext context, String hesapText) {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hesapText,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 25,
              color: Colors.yellow[800]!,
              fontWeight: FontWeight.bold),
        ),
        Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.yellow[800]!,
              width: 3,
            ))))
      ],
    ),
  );
}
