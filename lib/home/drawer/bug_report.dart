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
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {
            Text("Error");
          },
          onNavigationRequest: (NavigationRequest request) {
            print("REQUEST !!!!");
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
        body: Stack(
          children: [
            WebViewWidget(
              controller: _controller,
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
              ),
          ],
        ));
    //WebViewWidget(controller: _controller),
    //);
  }
}
