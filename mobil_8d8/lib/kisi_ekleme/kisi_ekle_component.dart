import 'package:flutter/material.dart';

Widget kisiEkleCard(BuildContext context, Function kisiEklePages,
    String userJob, String userJobInfo) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: 70,
                width: 125,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: const Color(0xFF4567b7)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => kisiEklePages()),
                    );
                  },
                  child: Text(
                    userJob,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userJobInfo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget homePageButton(BuildContext context, Function homePage) {
  double deviceWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    height: 40,
    width: deviceWidth - 20,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: const Color(0xFF4567b7)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => homePage()),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(4),
          child: Text('ANA SAYFAYA GERİ DÖN',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        )),
  );
}

Widget userEkle(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  textAlign: TextAlign.start,
                  "Numarama bağlı kişiler: \n5380396169",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 40,
                  width: deviceWidth - 10,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: const Color(0xFF4567b7)),
                      onPressed: () {},
                      child: const Text('Numarama bağlı kayıtları listele',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget userConnectCard(
  BuildContext context, {
  required TextEditingController controller,
  required String hintText,
  required String whosePhone,
  required Function(String) onChanged,
  TextInputType keyboardType = TextInputType.text,
  required number,
}) {
  double deviceWidth = MediaQuery.of(context).size.width;
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.start,
                  whosePhone,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: controller,
                  onChanged: onChanged,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  height: 40,
                  width: deviceWidth - 10,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: const Color(0xFF4567b7)),
                      onPressed: () {
                        if (number.toString().length != 10 ||
                            number.toString()[0] != '5') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  duration: Duration(milliseconds: 1000),
                                  content: Text(
                                    'Numara eksik veya hatalı',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )));
                        }
                      },
                      child: const Text('Numaraya bağlı kayıtları listele',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
