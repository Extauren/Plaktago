import 'package:flutter/material.dart';
import 'package:plaktago/statistic/game_list/game_list.dart';
import 'package:plaktago/utils/app_settings.dart';
import 'package:plaktago/utils/isar_service.dart';
import 'package:plaktago/statistic/statistic_button.dart';
import 'package:provider/provider.dart';
import 'general/general_statistics.dart';

class Statistic extends StatefulWidget {
  final AppSettings appSettings;
  const Statistic({Key? key, required this.appSettings}) : super(key: key);

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
          body: ListView(
              physics: statType == StatType.list
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: StatTypeButton(updateStatType: updateStatType)),
                if (statType == StatType.general)
                  GeneralStatistic(
                      isarService: isarService,
                      appSettings: widget.appSettings),
                if (statType == StatType.list)
                  GameList(
                    isarService: isarService,
                  )
              ]));
    });
  }
}
