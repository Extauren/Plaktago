import 'package:flutter/material.dart';
import 'package:plaktago/statistic/game_list.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/statistic/statistic_button.dart';
import 'package:provider/provider.dart';
import 'general_statistics.dart';

class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _Statistic();
}

class _Statistic extends State<Statistic> {
  StatType statType = StatType.general;
  int expandedIndex = -1;

  void updateStatType() {
    setState(() {
      if (statType == StatType.general) {
        statType = StatType.list;
      } else {
        statType = StatType.general;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<IsarService>(builder: (context, provider, child) {
      IsarService isarService = context.watch<IsarService>();
      return Scaffold(
          appBar: AppBar(title: Text("Statistiques")),
          body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(children: [
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: StatTypeButton(
                        statType: statType, updateStatType: updateStatType)),
                if (statType == StatType.general)
                  GeneralStatistic(
                    isarService: isarService,
                  ),
                if (statType == StatType.list)
                  GameList(
                    isarService: isarService,
                  )
              ])));
    });
  }
}
