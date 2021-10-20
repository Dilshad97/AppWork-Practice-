import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Dilshad extends StatefulWidget {
  const Dilshad({Key? key}) : super(key: key);

  @override
  _DilshadState createState() => _DilshadState();
}


class _DilshadState extends State<Dilshad> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: _loadPage,
          //   child: const Icon(Icons.refresh),
          // ),
          body:TextButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Navi("https://flutter.dev/"),)),
            child: Text('Click'),
          ) ,
        ));
  }
}


class Navi extends StatefulWidget {
  const Navi(String s, {Key? key}) : super(key: key);

  @override
  _NaviState createState() => _NaviState();
}
const String flutterUrl = "https://flutter.dev/";

class _NaviState extends State<Navi> {
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
            initialUrl: flutterUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller = webViewController;
            },

          ),
        ));
  }
}
