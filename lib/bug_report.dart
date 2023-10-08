import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BugReport extends StatefulWidget {
  BugReport({
    Key? key,
  }) : super(key: key);

  @override
  State<BugReport> createState() => _BugReport();
}

class _BugReport extends State<BugReport> {
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
            Text("Coucou");
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://form.jotform.com/plaktago/report-de-bug-plaktago'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signaler un bug")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
