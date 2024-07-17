// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobil_8d8/hesap/constant.dart';
import 'package:timer_count_down/timer_count_down.dart';

void main() {
  runApp(const OnayKodu2());
}

class OnayKodu2 extends StatelessWidget {
  const OnayKodu2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.yellow,
              brightness: Brightness.dark,
              // ignore: deprecated_member_use
              background: Colors.amber),
        ),
        home: const OnayKodu20());
  }
}

class OnayKodu20 extends StatefulWidget {
  const OnayKodu20({super.key});

  @override
  _OnayKodu20State createState() => _OnayKodu20State();
}

class _OnayKodu20State extends State<OnayKodu20> {
  final _formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  int initialSeconds = 120;
  int value1 = 0;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AKTİVASYON'),
      ),
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        // width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey[800]!,
              Colors.grey[500]!,
              Colors.blueGrey[900]!,
            ],
          ),
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Lütfen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.yellow,
                            fontWeight: FontWeight.normal),
                      ),
                      const Text(
                        ' 5365731778 ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        'numaralı cep telefonuna gelen 4 haneli onay kodunu giriniz',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.yellow,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: codeController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => setState(() {
                          value1 = int.parse(value);
                        }),
                        decoration: InputDecoration(
                          hintText: 'Onay Kodu',
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[700]!),
                          border: const OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.length != 4) {
                            return 'Onay kodu 4 haneli olmalıdır';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll<Color>(
                                Color(0xFF4567b7))),
                        onPressed: () {
                          if (value1 == 1234 && initialSeconds != 0) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    duration: Duration(milliseconds: 1000),
                                    content: Text(
                                      'Onay kodu doğrulandı ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )));
                            Navigator.pop(context);
                          } else if (initialSeconds == 0) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    duration: Duration(milliseconds: 1000),
                                    content: Text(
                                      'Süreniz Doldu ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    duration: Duration(milliseconds: 1000),
                                    content: Text(
                                      'Onay kodu hatalı',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )));
                          }
                        },
                        child: const Text(
                          'ONAY',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Countdown(
                        seconds: initialSeconds,
                        build: (BuildContext context, double time) {
                          if (time.round() > 60) {
                            return Text(
                              '${time.round().toString()}'
                              '\n saniye sonra onay kodu geçersiz olacaktır.',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            );
                          } else if (time.round() > 0) {
                            return Text(
                                '${time.round().toString()}'
                                '\nsaniye sonra onay kodu geçersiz olacaktır.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.bold));
                          } else {
                            initialSeconds = time.round();

                            return Text('Süreniz doldu tekrar deneyin.',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.bold));
                          }
                        },
                        interval: const Duration(milliseconds: 100),
                      ),
                      const SizedBox(height: 90),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(
                                  Color(0xFF4567b7))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('KAPAT',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    ],
                  ),
                ),
              ),
            ),
            firma(context),
          ],
        ),
      ),
    );
  }
}
