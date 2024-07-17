import 'dart:convert';
import 'dart:io';
import 'package:mobil_8d8/save_json/user_info.dart';

Future<void> saveUserToJson(List<User> users, String filePath) async {
  // Ensure the directory exists
  final directory = File(filePath).parent;
  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }
  // Convert the list of users to a list of maps
  List<Map<String, dynamic>> jsonList =
      users.map((user) => user.toJson()).toList();

  // Convert the list of maps to a JSON string
  String jsonString = jsonEncode(jsonList);

  // Get the file
  File file = File(filePath);

  // Write the JSON string to the file
  await file.writeAsString(jsonString);
}

Future<void> saveUsers(List<User> users, String filePath) async {
  try {
    final directory = Directory(filePath).parent;
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    await saveUserToJson(users, filePath);
    print('Users saved to $filePath');
  } catch (error) {
    print('Failed to save users: $error');
  }
}
