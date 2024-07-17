import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobil_8d8/main_component.dart';
import 'package:mobil_8d8/onay_kodu.dart';
import 'package:mobil_8d8/save_json/save_json.dart';
import 'package:mobil_8d8/save_json/user_info.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: OkulGuvenligiPage(user: User(name: '', surname: '', number: '')),
    );
  }
}

class OkulGuvenligiPage extends StatefulWidget {
  const OkulGuvenligiPage({super.key, required this.user});
  final User user;

  @override
  // ignore: library_private_types_in_public_api
  _OkulGuvenligiPageState createState() => _OkulGuvenligiPageState();
}

class _OkulGuvenligiPageState extends State<OkulGuvenligiPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isAgreed = false;
  String filePath = "assets/users_json/users.json";
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final numberController = TextEditingController();
  User kayit = User(name: null, surname: null, number: null);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.grey[900]!,
                Colors.grey[800]!,
                Colors.blueGrey[900]!,
              ],
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mainText(context, 'Adınız:'),
                  textInputForm(
                    controller: firstNameController,
                    hintText: '   Giriniz..',
                    // validator: (value) =>
                    //     ValidationMixin().validateFirstName(value!),
                    onChanged: (value) => setState(() {
                      kayit.name = value;
                    }),
                  ),
                  mainText(context, 'Soyadınız:'),
                  textInputForm(
                    controller: lastNameController,
                    hintText: '   Giriniz..',
                    // validator: (value) =>
                    //     ValidationMixin().validateLastName(value!),
                    onChanged: (value) => setState(() {
                      kayit.surname = value;
                    }),
                  ),
                  mainText(context, 'Cep Telefonu:'),
                  textInputForm(
                    controller: numberController,
                    hintText: '   5XX XXX XXXX',
                    // validator: (value) =>
                    //     ValidationMixin().validateNumber(value!),
                    onChanged: (value) => setState(() {
                      kayit.number = value;
                    }),
                    keyboardType: TextInputType.phone,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isAgreed,
                        onChanged: (value) {
                          setState(() {
                            _isAgreed = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Kullanıcı Sözleşmesini ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.orange[900]!,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => launchUrlString(
                                      'https://www.okulguvenligi.com/sogip/privacy.html'),
                              ),
                              TextSpan(
                                text: '\nokudum, kabul ediyorum.',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueGrey[500]!,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (kayit.name!
                                .replaceAll(RegExp(r"\s+"), "")
                                .isEmpty ||
                            kayit.surname!
                                .replaceAll(RegExp(r"\s+"), "")
                                .isEmpty ||
                            kayit.number!
                                .replaceAll(RegExp(r"\s+"), "")
                                .isEmpty ||
                            kayit.number.toString()[0] != '5' ||
                            kayit.number!.length != 10) {
                          InfoSnackbar.mainSnackbar(
                              context, 'Lütfen formu eksiksiz doldurunuz');
                          return;
                        }
                        if (_isAgreed == false) {
                          InfoSnackbar.mainSnackbar(context,
                              'Lütfen kullanıcı sözleşmesini imzalayınız');
                          return;
                        } else {
                          List<User> users = [
                            User(
                              name: kayit.name!.trim(),
                              surname: kayit.surname!.trim(),
                              number: kayit.number!.trim(),
                            ),
                          ];

                          saveUsers(users, filePath);

                          InfoSnackbar.mainSnackbar(
                              context, 'Formunuz gönderildi. Teşekkürler.');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ActivationPage()),
                          );
                          return;
                        }
                      },
                      child: const Text(
                        'KAYIT OL',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(child: logo(context)),
                  const SizedBox(height: 15.0),
                  Center(child: maintitle(context)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
