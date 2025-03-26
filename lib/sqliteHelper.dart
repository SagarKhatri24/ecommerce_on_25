import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDatabaseHelper{

  static const databaseName = "student.db";
  static const databaseVersion = 1;

  static const tableName = "users";

  static const columnId = "id";
  static const columnName = "name";
  static const columnEmail = "email";
  static const columnContact = "contact";
  static const columnPassword = "password";

  static final SqliteDatabaseHelper instance = SqliteDatabaseHelper();
  Database? databaseMain;

  Future<Database?> get database async{
    if(databaseMain!=null) return databaseMain;
    databaseMain = await initDatabase();
    return databaseMain;
  }

  initDatabase() async{
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path,databaseName);
    return await openDatabase(path,version: databaseVersion,onCreate: onCreateMethod);
  }

  Future onCreateMethod(Database db, int version) async{
    await db.execute(
      '''
        CREATE TABLE $tableName(
          $columnId INTEGER PRIMARY KEY,
          $columnName TEXT NOT NULL,
          $columnEmail TEXT NOT NULL,
          $columnContact TEXT NOT NULL,
          $columnPassword TEXT NOT NULL,
        )
      '''
    );
  }

  Future<int> insert(Map<String,dynamic> row) async{
    Database? db = await instance.database;
    return await db!.insert(tableName, row);
  }

  Future<int> update(Map<String,dynamic> row, String contact) async{
    Database? db = await instance.database;
    return await db!.update(tableName, row, where: '$columnContact = ?', whereArgs: [contact]);
  }

  Future<int> delete(String contact) async{
    Database? db = await instance.database;
    return await db!.delete(tableName, where: '$columnContact = ?', whereArgs: [contact]);
  }

  Future<List<Map<String,dynamic>>> getAllData() async{
    Database? db = await instance.database;
    return await db!.query(tableName);
  }

  Future<List<Map<String,dynamic>>> getSearchData(String contact) async{
    Database? db = await instance.database;
    return await db!.query(tableName, where: '$columnContact = ?', whereArgs: [contact]);
  }

}