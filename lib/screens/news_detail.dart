import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailScreen extends StatelessWidget {
  static const routePage = '/news-detail-screen';
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _completer = Completer<WebViewController>();
    final url = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Flutter',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  'News',
                  style: TextStyle(color: Colors.blue),
                )
              ])),
      body: Container(
          child: WebView(
        initialUrl: url,
        onWebViewCreated: (controller) {
          _completer.complete(controller);
        },
      )),
    );
  }
}
