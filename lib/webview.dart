import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebViewClass extends StatefulWidget {
  final String articleUrl;
  WebViewClass({Key key,this.articleUrl}):super(key: key);

  @override
  _WebViewClassState createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.grey[850],
              floating: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('News'),
                  Text(
                    'App',
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  )
                ],
              ),
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:WebView(
                  initialUrl: widget.articleUrl,
                  javascriptMode: JavascriptMode.unrestricted,
                  gestureRecognizers: Set()
                    ..add(Factory<VerticalDragGestureRecognizer>(
                        ()=>VerticalDragGestureRecognizer()
                    )),
                  onWebViewCreated: (WebViewController webviewcontroller){
                    _controller.complete(webviewcontroller);
                  },
                )
              )
            )
          ],
        ),
      ),
    );
  }
}

