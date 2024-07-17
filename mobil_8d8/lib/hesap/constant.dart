import 'package:flutter/material.dart';
import 'package:mobil_8d8/kisi_hesabi_giris.dart';

Widget kisiHesabi(BuildContext context) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  return Container(
      width: deviceWidth,
      height: deviceHeight / 7,
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 40,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.amber),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://e7.pngegg.com/pngimages/799/987/png-clipart-computer-icons-avatar-icon-design-avatar-heroes-computer-wallpaper-thumbnail.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'MEHMET SÖĞÜNMEZ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  const Text(
                    'SEKİZDESEKİZ BİLGİSAYAR LIMITED ŞİRKETİ',
                    style:
                        TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Öğrenci olarak takip ediliyor',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.lightBlue[700]),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KisiHesabiGiris()));
                    },
                    icon: const Icon(Icons.supervisor_account_rounded),
                  ),
                  const Text(
                    'KİŞİLER',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ]),
      ));
}

Widget firma(BuildContext context) {
  return Expanded(
    child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        width: double.infinity,
        height: 20,
        color: Colors.blueGrey[300],
        child: const FittedBox(
          child: Text(
            '® Sekizdesekiz Grup',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
      const SizedBox(height: 20),
    ]),
  );
}

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First Flutter App'),
        ),
        body: const Center(
          child: Text('Hello, Flutter!'),
        ),
      ),
    );
  }
}
