import 'package:flutter/material.dart';

class DrawerApp extends StatefulWidget {
  final Function changeTheme;
  const DrawerApp({Key? key, required this.changeTheme});

  @override
  State<DrawerApp> createState() => _Drawer();
}

class _Drawer extends State<DrawerApp> {
  static bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text('Settings'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                margin: EdgeInsets.only(right: 10), child: Text("Dark mode")),
            Switch(
                value: _darkMode,
                //activeColor: Colors.red,
                onChanged: (bool value) {
                  setState(() {
                    _darkMode = value;
                    widget.changeTheme();
                  });
                }),
          ])
        ],
      ),
    );
  }
}
