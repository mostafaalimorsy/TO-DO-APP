import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/contoller/cubit/states.dart';
import 'package:todoapp/view/screen/addscreen.dart';
import 'package:todoapp/view/screen/archivescreen.dart';
import 'package:todoapp/view/screen/fristscreen.dart';
import 'package:todoapp/view/screen/taskscreen.dart';

class AppCubit extends Cubit<toDoAppStates> {
  AppCubit() : super(intialAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String> titels = [
    "TO DO Tasks",
    "Done Tasks",
    "Archive Tasks",
    "New Tasks"
  ];
  List<Widget> screens = [
    fristScreen(),
    taskScreen(),
    archiveScreen(),
    addScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(appChangeBottomNavBarState());
  }

  var database;
  List<Map> allTasks = [];
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archvieTasks = [];


// open the database
  void CreateDataBase() {
    // open the database
    database =
        openDatabase("todo.db", version: 1, onCreate: (database, version) {
      print("it is Create");
      database.execute(
          'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, Title TEXT, description INTEGER, date TEXT,Time TEXT , status TEXT)');
    }, onOpen: (database) {
      getDataFromDB(database);
      print("it is open");
    }).then((value) {
      database = value;
      emit(appCreateDataBaseState());
      print("emit is done");
    });
  }

// Insert some records in a transaction
  Future InsertToDataBase(
    {required String title, required String description, required String date, required String time}) async {

   await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO Tasks(Title, description, date,Time,status) VALUES("$title", "$description", "$date","$time" ,"New")');
    print('inserted1: $id1');

    emit(appInsertDataBaseState());
    getDataFromDB(database);
    print("inserted");

});

  }


  // get data from database
   Future getDataFromDB(database)
async {
    emit (appGetDataBaseState());
   allTasks = await database.rawQuery('SELECT * FROM Tasks');
    validateTasks(allTasks);
    print ("it is working");
    emit(appGetDataBaseState());

   print(allTasks);

}

//to update data in database
  void updateData  ({
    required String status, required int id,}

      )
  async {
    // Update some record
     database.rawUpdate(
        'UPDATE Tasks SET status = ? WHERE id = ?',
        ['$status', id]);

    emit(appUpdateDataBaseState());
    emit(appGetDataBaseState());

     getDataFromDB(database);
  }


  void deleteData ({required int id})
  async {
    await database
        .rawDelete('DELETE FROM Tasks WHERE id  = ?', [id]);
    emit(appDeleteDataBaseState());
    getDataFromDB(database);

  }



//check if the task is done or new or archive
  void validateTasks(e)
  {
     newTasks = [];
     doneTasks = [];
     archvieTasks = [];

    e.forEach((e)
    {
      if (e['status']=='archive')
        {
          archvieTasks.add(e);
          print(e);
        }else if (e['status']=='done')
          {
            doneTasks.add(e);
            print(e);
          }else
          {
            newTasks.add(e);
            print(e);
          }
      print(e['status']);
    });

  }
}
