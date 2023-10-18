import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GithubPage extends StatefulWidget {
  GithubPage({
    Key? key,
  }) : super(key: key);

  @override
  State<GithubPage> createState() => _GithubPage();
}

class _GithubPage extends State<GithubPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            Text("Loading");
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://github.com/Extauren/Plaktago-App'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Github")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
