import 'package:flutter/material.dart';

Widget bildirimDuyuru(BuildContext context, List<String> bildirimlerListesi,
    List<String> saatListesi, List<String> gonderimzamani, IconData iconData) {
  return Expanded(
    child: ListView.builder(
      itemCount: bildirimlerListesi.length,
      itemBuilder: (context, index) {
        final bildirim = bildirimlerListesi[index];
        final saat = saatListesi[index];
        final titledate = gonderimzamani[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  titledate,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[850],
                  ),
                ),
              ),
            ),
            Material(
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent[700],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 40,
                  width: 40,
                  child: Icon(
                    iconData,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  bildirim,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey[800],
                  ),
                ),
                tileColor: Colors.deepOrange[400],
                subtitle: Text(
                  saat,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.lightBlue[900],
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(bildirim),
                          content: Text('$saat \n$titledate'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Okundu'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Delete'),
                              child: const Text('Sil'),
                            ),
                          ],
                        );
                      });
                },
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
          ],
        );
      },
    ),
  );
}

Widget bildirimAyarlari(
    BuildContext context, String text, Function() onSwitched, bool switched) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: switched ? Colors.teal[100] : Colors.blueGrey[100],
        ),
      ),
      Switch(
        thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return const Icon(Icons.check);
            }
            return const Icon(Icons.close);
          },
        ),
        value: switched,
        onChanged: (value) => onSwitched(),
        activeTrackColor: Colors.lightGreen[400],
        activeColor: Colors.blueGrey[300],
        inactiveTrackColor: Colors.blueGrey[700],
        inactiveThumbColor: Colors.grey[700],
      ),
    ],
  );
}

Future<String?> tumunuOkuSil(
    BuildContext context, String text1, String text2) async {
  return await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(text1),
        content: Text(text2),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Read'),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'Delete'),
            child: const Text('Tamam'),
          ),
        ],
      );
    },
  );
}

Widget bildirimAyarlariText(BuildContext context, String text) {
  return Text(text,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.blueGrey[900],
      ));
}
