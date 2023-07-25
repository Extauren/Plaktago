import 'package:flutter/material.dart';

class GeneralStatistic extends StatefulWidget {
  final Function getGeneralStatistics;
  const GeneralStatistic({Key? key, required this.getGeneralStatistics})
      : super(key: key);

  @override
  State<GeneralStatistic> createState() => _GeneralStatistic();
}

class _GeneralStatistic extends State<GeneralStatistic> {
  Map<String, dynamic> data = {};
  List<String> values = ["", "", "", "", "", ""];
  final List<String> titles = [
    "Partie total",
    "Bingo Plaque",
    "Bingo Rat",
    "Bingo gagnés",
    "test",
    "test"
  ];

  @override
  void initState() {
    super.initState();
    getStatistics();
  }

  void getStatistics() async {
    data = await widget.getGeneralStatistics();
    values[0] = data["nbGames"].toString();
    values[1] = data["bingoPlaque"].toString();
    values[2] = data["bingoRat"].toString();
    values[3] = data["bingoWin"].toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 220,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.4),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    margin: const EdgeInsets.all(5),
                    color: Theme.of(context).colorScheme.primary,
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Container(
                              margin: const EdgeInsets.all(0.5),
                              child: Text(titles[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black))),
                          Container(
                              margin: EdgeInsets.only(top: 2),
                              child: Text(values[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 26)))
                        ])));
              }))
    ]);
  }
}
