//
// import 'package:sqflite/sqflite.dart';
// var database;
// List <Map> allTasks =[];
//
//
//
// // open the database
// void CreateDataBase() async {
//   // open the database
//    database = await openDatabase("todo.db", version: 1,
//       onCreate: (database, version) async {
//     print("it is Create");
//     await database.execute(
//         'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, Title TEXT, description INTEGER, date TEXT,Time TEXT , status TEXT)');
//   }, onOpen: (database) async {
//          await getDataFromDB(database);
//     print("it is open");
//   });
// }
//
//
//
//
// // Insert some records in a transaction
// Future InsertToDataBase(
//     {required String title, required String description, required String date, required String time}) async {
//
//   return await database.transaction((txn) async {
//     int id1 = await txn.rawInsert(
//         'INSERT INTO Tasks(Title, description, date,Time,status) VALUES("$title", "$description", "$date","$time" ,"New")');
//     print('inserted1: $id1');
//
// });
//
//
//
//
//
//       }
//
//
//
// //get data from database
//   getDataFromDB(database)
// async {
//    allTasks = await database.rawQuery('SELECT * FROM Tasks');
//    print(allTasks);
//   // print(tasks[0]);
//
// }
//
