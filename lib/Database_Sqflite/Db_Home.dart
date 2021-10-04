import 'package:flutter/material.dart';

import 'DB_Helper.dart';

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title='Dilshad';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late String searchText;
  TextEditingController _searchQuery = new TextEditingController();
  late Future<List<Map<dynamic, dynamic>>> _RecentSearch;
  List<Map<dynamic, dynamic>> searchList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearchFromDB();
  }

  void _addText() {
    setState(() {
      searchText = _searchQuery.text;
    });
    DBHelper.instance.addText({
      DBHelper.TABLE_COLUMN_TEXT:
      searchText
    });
    getSearchFromDB();
  }


  void getSearchFromDB() {
    _RecentSearch = DBHelper.instance.getTextList();
    _RecentSearch.then((value) => this.setState(() {
      searchList = value;
    }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: TextField(
              controller: _searchQuery,
            ),margin: EdgeInsets.all(10),)
            ,
            Expanded(child:
            ListView.builder(
                itemCount: searchList.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    leading: Icon(Icons.list),
                    trailing: GestureDetector(child: Icon(Icons.remove_circle_outline), onTap: ()=>{DBHelper.instance
                        .deleteText(
                        searchList[index]
                        [DBHelper
                            .TABLE_COLUMN_TEXT]),
                      getSearchFromDB()}),
                    title:Text(searchList[index][DBHelper.TABLE_COLUMN_TEXT]),
                  );
                }
            ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addText,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}