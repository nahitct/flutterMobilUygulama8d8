import 'package:flutter/material.dart';

Widget cardWidget(BuildContext context, Function sayfa) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                height: 30,
                width: 75,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Colors.orange[300]),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Takip Listesinden Çıkar'),
                            content: const Text(
                                'MEHMET SÖĞÜNMEZ kişisini silmek üzeresiniz.\nDevam etmek istiyor musunuz?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Hayır'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('Evet'),
                              ),
                            ],
                          );
                        });
                  },
                  child: Text(
                    'SİL',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[900]),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16.0),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MEHMET SÖĞÜNMEZ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'SEKİZDESEKİZ BİLGİSAYAR LIMITED ŞİRKETİ',
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Öğrenci olarak takip ediliyor',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => sayfa()));
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    ),
  );
}

Widget girisButton(
    BuildContext context, Function pageGirisButton, String buttonText) {
  return SizedBox(
    height: 40,
    width: 1000,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: const Color(0xFF4567b7)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageGirisButton()),
        );
      },
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

Widget kisiListText(BuildContext context) {
  return Text(
    ' Kişi Listesi ',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: 18,
        color: Colors.blueGrey[900]!,
        fontWeight: FontWeight.w900),
  );
}
