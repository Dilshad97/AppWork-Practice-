import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static Database ?_database;
  static final _dbName='myDatabase.db';
  static final _dbVersion =1;
  static final _tableName ='myTable';
  static final columnId ='id';
  static final columnName ='name';
  static final columnAge = 'age';



  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance =DatabaseHelper._privateConstructor();


  Future<Database?>get database async{
    if (_database !=null)
      return _database;

    _database=await _initiateDatabase();

    return _database;

  }

  _initiateDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path =join( directory.path,_dbName);
    await openDatabase(path,version: _dbVersion,onCreate:_onCreate);
    var theDb = await openDatabase(path,
        version: _dbVersion, onCreate: _onCreate);
    return theDb;


  }

  void _onCreate(Database db, int version) async {
    var onCreateRecentSearchDataTable =
        "CREATE TABLE $_tableName (" +
            "$columnId INTEGER PRIMARY KEY AUTOINCREMENT ," +
            " $columnName TEXT)";
    await db.execute(onCreateRecentSearchDataTable);
  }

  // insert

  Future<String?> insert( Map<String, dynamic> row) async{
    var dbClient = await database;
    try{
      await dbClient!.insert(_tableName, row);
    }catch (e) {
      print("Error--> $e");
    }
  }


  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(_tableName);
  }
//updating Database
  Future update(Map<String,dynamic>row)async{
    Database? db= await instance.database;
    int id= row[columnId];

    return await db!.update(_tableName, row,where: '$columnId= ?',whereArgs: [id]);

  }



    delete(String productId) async {
    var dbClient = await database;
    return await dbClient!.delete(_tableName,
        where: '$columnId = ?',
        whereArgs: [productId]);
  }

}