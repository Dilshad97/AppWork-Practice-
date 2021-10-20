import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News2 extends StatefulWidget {
  final String author;
  final String title;
  final String urlToImage;
  final String url;
  final String content;
  final String publishedAt;

  News2(this.author, this.title, this.urlToImage, this.url, this.content,
      this.publishedAt);

  @override
  _News2State createState() => _News2State();
}

class _News2State extends State<News2> {
  void initState() {
    super.initState();
    log('data lis ${widget.url}');

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
                            widget.author ==null? "dd" : widget.author,
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
                            widget.author == null ? "dd" : widget.title,
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      child: widget.urlToImage == null
                          ? Image.network(
                              'https://www.thedroidsonroids.com/wp-content/uploads/2019/01/flutter_blog-1200x640.png')
                          : Image.network(widget.urlToImage),
                    ),
                    Card(
                      color: Colors.deepPurpleAccent,
                      child: Row(
                        children: [
                          Text('Published At : ',
                              style: TextStyle(color: Colors.white)),
                          Text(
                              widget.author == null ? "dd" : widget.publishedAt,
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
                            widget.author == null ? "dd" : widget.content,
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.deepPurpleAccent,
                      child: Row(
                        children: [
                          Text('Visit @  :  ', style: TextStyle(color: Colors.white)),
                         Expanded(
                           child: TextButton(
                             child: Text(widget.url),
                             onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => Web(widget.url),));
                             },
                           ),
                         )
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 1.3,
                          //   child: TextButton(
                          //       onPressed: () {
                          //         WebView(
                          //           initialUrl: widget.url,
                          //         );
                          //       },
                          //       child: Text(
                          //           widget.author == null ? "dd" : widget.url)),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            )));
  }
}

class Web extends StatefulWidget {
  String url;
   Web(this.url) ;

  @override
  _WebState createState() => _WebState();
}

class _WebState extends State<Web> {

  @override
  Widget build(BuildContext context) {
    late WebViewController _controller;

    _back() async {
      if (await _controller.canGoBack()) {
        await _controller.goBack();
      }
    }

    _forward() async {
      if (await _controller.canGoForward()) {
        await _controller.goForward();
      }
    }

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('WebView'),
            actions: <Widget>[
              IconButton(
                onPressed: _back,
                icon: const Icon(Icons.arrow_back_ios),
              ),
              IconButton(
                onPressed: _forward,
                icon: const Icon(Icons.arrow_forward_ios),
              ),
              const SizedBox(width: 10),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: _loadPage,
          //   child: const Icon(Icons.refresh),
          // ),
          body: WebView(
            key: const Key("webview"),
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },

          ),
        ));
  }
}
