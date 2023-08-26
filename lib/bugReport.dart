import 'package:flutter/material.dart';

class BugReport extends StatefulWidget {
  BugReport({
    Key? key,
  }) : super(key: key);

  @override
  State<BugReport> createState() => _BugReport();
}

class _BugReport extends State<BugReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signaler un bug")),
    );
  }
}
