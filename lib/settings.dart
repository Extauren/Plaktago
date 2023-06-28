import 'package:flutter/material.dart';
import 'home/drawer.dart';

class Settings extends StatefulWidget {
  final Function changeTheme;
  const Settings({Key? key, required this.changeTheme}) : super(key: key);

  @override
  State<Settings> createState() => _Settings();
}

class _Settings extends State<Settings> {
  final items = ['One', 'Two', 'Three', 'Four'];
  String selectedValue = 'Four';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Row(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),

            // dropdown below..
            child: DropdownButton<String>(
              value: selectedValue,
              onChanged: (value) {
                setState(() => selectedValue = value!);
              },
              // onChanged: (String newValue) {
              //   setState(() => selectedValue = newValue);
              // },
              items: items
                  .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                  .toList(),

              // add extra sugar..
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 42,
              underline: SizedBox(),
            ),
          )
        ]));
  }
}
