import 'package:counter_bloc/bloc/States/bloc_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BlocApp extends Cubit<BlocState> {
  BlocApp() : super(InitialState());
  int counter = 0;
  void incrementCounter() {
    counter++;
    emit(IncrementCounter());
  }

  void decrementCounter() {
    counter--;
    emit(DecrementCounter());
  }

//  --------------------------------------------------
  late Database database;

  void initDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'users.db');
    debugPrint('AppDatabaseInitialized');
    onOpenDatabase(path: path);
    emit(AppDatabaseInitialized());
  }

  void onOpenDatabase({required String path}) async {
    // open the database
    openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db
          .execute('CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT)');
      debugPrint('Table Created');
    }, onOpen: (
      Database db,
    ) {
      debugPrint('AppDatabaseOpened');
      database = db;
      getUsersData();
    });
  }

  TextEditingController userNameController = TextEditingController();

  void insertUserData() async {
    if (selectUser.isNotEmpty) {
      updateUserData();
      return;
    }
    // Insert some records in a transaction
    database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO users(name) VALUES("${userNameController.text}")');
    }).then((value) {
      debugPrint('Database Users inserted');
      userNameController.clear();
      getUsersData();
      emit(AppDatabaseUsersInserted());
    });
  }

  List<Map> users = [];

  void getUsersData() async {
    emit(AppDatabaseUsersLoading());

    // Get the records
    database.rawQuery('SELECT * FROM users').then((value) {
      debugPrint('Database Users fetched');
      debugPrint('$users');

      users = value;
      emit(AppDatabaseUsersFetched());
    });
  }

  Map selectUser = {};

  void selectedUserToUpdate({required Map user}) {
    selectUser = user;
    userNameController.text = selectUser['name'];
    emit(AppSelectedUser());
  }

  void updateUserData() {
    // Update some record
    database.rawUpdate(
        'UPDATE users SET name = ? WHERE id = ${selectUser['id']}',
        [(userNameController.text)]).then((value) {
      selectUser = {};
      userNameController.clear();

      debugPrint('Database Users Updated');
      getUsersData();
    });
  }
}
