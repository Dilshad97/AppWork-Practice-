import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Database_helper.dart';

class DataBase extends StatefulWidget {
  const DataBase({Key? key}) : super(key: key);

  @override
  _DataBaseState createState() => _DataBaseState();
}

class _DataBaseState extends State<DataBase> {
  final dbHelper = DatabaseHelper.instance;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sqf lite Database Example"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  _insert();
                },
                 child: Text("Insert"),
              ),
              ElevatedButton(
                onPressed: () {
                  _query();
                },
                 child: Text("Query"),

              ),
              ElevatedButton(
                onPressed: () {
                  _update();
                },
                 child: Text("Update"),

              ),
              ElevatedButton(
                onPressed: () {

                },
                 child: Text("Delete"),

              ),
            ],
          ),
        ),
      ),
    );
  }


  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : 'Bob',
      DatabaseHelper.columnAge  : 23
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : 'Mary',
      DatabaseHelper.columnAge  : 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }


  // void _delete() async {
  //   // Assuming that the number of rows is the id for the last row.
  //   final id = await dbHelper.queryRowCount();
  //   final rowsDeleted = await dbHelper.delete(id);
  //   print('deleted $rowsDeleted row(s): row $id');
  // }

}
