import 'package:flutter/material.dart';

Widget logo(BuildContext context) {
  return Center(
    child: Image.asset(
      'lib/assets/images/mobile.png',
      width: 200.0,
    ),
  );
}

Widget maintitle(BuildContext context) {
  return Center(
    child: Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          textAlign: TextAlign.center,
          "SEKİZDESEKİZ OKUL GÜVENLİĞİ İLETİŞİM PLATFORMU",
          style: TextStyle(
            color: Colors.blue[300],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

class InfoSnackbar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> mainSnackbar(
      BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        content: Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

Widget mainText(BuildContext context, String userinfo) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Text(
      userinfo,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.yellow[800],
      ),
    ),
  );
}

Widget backGroundDecoration(BuildContext context) {
  return Container(
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
  );
}

Widget textInputForm({
  required TextEditingController controller,
  required String hintText,
  required Function(String) onChanged,
  String? Function(String?)? validator,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: const UnderlineInputBorder(),
      ),
    ),
  );
}

class ValidationMixin {
  String? validateFirstName(String value) {
    if (value.replaceAll(RegExp(r"\s+"), "").isEmpty) {
      return "Lütfen adınızı doğru şekilde yazınız.";
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.replaceAll(RegExp(r"\s+"), "").isEmpty) {
      return "Lütfen soyadınızı doğru şekilde yazınız.";
    }
    return null;
  }

  String? validateNumber(String value) {
    if (value.toString()[0] != '5') {
      return "Numaranız 5 ile başlamalıdır";
    }
    if (value.length != 10) {
      return "Numaranız 10 haneli olmalıdır";
    }
    return null;
  }
}
