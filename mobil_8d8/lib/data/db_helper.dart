// import 'dart:async';

// import 'package:sqflite/sqflite.dart';

// class DbHelper {
//   Database _db;
//   Future<Database> get db async{
//     if (_db == null) {
//       _db = await initializeDb();
//   }
//   return _db;
// }
//   Future <Database> initializeDb() async {
//     String dbPath =  join(await getDatabasesPath(),"users.db");
//     var usersDb = openDatabase(dbPath,version: 1,onCreate: createDb);
//     return usersDb;
//   }
//    void createDb(Database db, int version) {
//     await db.execute("Create table users(id integer primary key,name text,surname text, number integer)");
//   }

