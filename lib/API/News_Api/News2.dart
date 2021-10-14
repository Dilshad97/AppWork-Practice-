import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News2 extends StatefulWidget {
  String author;
  String title;
  String urlToImage;

  String url;
  String content;
  String publishedAt;



  News2(this.author, this.title, this.urlToImage, this.url, this.content,
      this.publishedAt);

  @override
  _News2State createState() => _News2State();
}

class _News2State extends State<News2> {

  void initState(){
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Api Call '),
          ),
            backgroundColor: Colors.blueGrey,
            body: SingleChildScrollView(
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.deepPurpleAccent,
                      child: Row(
                        children: [
                          Text(
                            "Author Name  :  ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            widget.author,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.deepPurpleAccent,
                      child: Row(
                        children: [
                          Text(
                            "Tittle  :  ",
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(
                              child: Text(
                            widget.title,
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                    Card(
                        elevation: 20,
                        child: Image.network(widget.urlToImage)),
                    Card(
                      color: Colors.deepPurpleAccent,
                      child: Row(
                        children: [
                          Text('Published At : ',
                              style: TextStyle(color: Colors.white)),
                          Text(widget.publishedAt,
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.deepPurpleAccent,
                      child: Row(
                        children: [
                          Text('Content  :  ',
                              style: TextStyle(color: Colors.white)),
                          Expanded(
                              child: Text(
                            widget.content,
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.deepPurpleAccent,
                      child: Row(
                        children: [
                          Text('Visit @  :  ',
                              style: TextStyle(color: Colors.white)),
                          Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            child: TextButton(onPressed: () {
                              WebView(
                                initialUrl: widget.url,
                              );
                            }, child: Text(widget.url)),
                          )
                          
                        ],
                      ),
                    ),

                  ],
                ),
              )),
            )));
  }
}
