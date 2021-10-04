import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/**
 * Created by Anand_Kashyap on 27/5/21.
 */


class DBHelper {
  static Database ?_db;
  static const int DATABASE_VERSION = 1;
  static const String DATABASE_NAME = "OfflineDatabase.db";
  static const String TABLE_NAME = "SEARCH_TABLE";
  static const String TABLE_COLUMN_ID = "id";
  static const String TABLE_COLUMN_TEXT= "search";

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DATABASE_NAME);
    var theDb = await openDatabase(path,
        version: DATABASE_VERSION, onCreate: _onCreate);
    return theDb;
  }

  // Creating a tables
  void _onCreate(Database db, int version) async {
    var onCreateRecentSearchDataTable =
        "CREATE TABLE $TABLE_NAME (" +
            "$TABLE_COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT ," +
            " $TABLE_COLUMN_TEXT TEXT)";
    await db.execute(onCreateRecentSearchDataTable);
  }

  // To get all the values that is inserted in database
  Future<List<Map>> getTextList() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list = await dbClient!.query(TABLE_NAME);
    return list;
  }

  // addText method to inset the values in database.
  Future<String?> addText( Map<String, dynamic> search) async{
    var dbClient = await db;
    try{
      await dbClient!.insert(TABLE_NAME, search);
    }catch (e) {
      print("Error--> $e");
    }
  }

  // deleteText to perform delete query.
  deleteText(String productId) async {
    var dbClient = await db;
    return await dbClient!.delete(TABLE_NAME,
        where: '$TABLE_COLUMN_TEXT = ?',
        whereArgs: [productId]);
  }
}