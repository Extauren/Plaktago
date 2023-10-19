import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:plaktago/utils/app_settings.dart';
import '../../utils/save_game.dart';
import 'indicator.dart';

class NumberCards extends StatefulWidget {
  final List<CardList> cardList;
  final AppSettings appSettings;
  NumberCards({super.key, required this.cardList, required this.appSettings});
  @override
  State<StatefulWidget> createState() => _NumberCards();
}

class _NumberCards extends State<NumberCards> {
  final double width = 4;
  List<List<BarChartGroupData>> rawBarGroups = [[], []];
  late List<BarChartGroupData> showingBarGroups;
  List<List<BarChartGroupData>> groupData = [[], []];
  int skip = 0;
  int touchedGroupIndex = -1;
  int sortIndex = 1;
  int maxY = 0;

  @override
  void initState() {
    super.initState();
    sortByCheck();
    sortByPlayed();
  }

  void sortByPlayed() {
    int index = 0;
    widget.cardList.sort((a, b) {
      int value = b.nbPlayed.compareTo(a.nbPlayed);
      if (value == 0) {
        return -a.nbCheck.compareTo(b.nbCheck);
      }
      return value;
    });

    maxY = widget.cardList[0].nbPlayed;
    for (int it = 0; it < widget.cardList.length; it++) {
      if (it % width == 0) {
        index = 0;
      }
      groupData[0].add(makeGroupData(
          index,
          widget.cardList.elementAt(it).nbCheck.toDouble(),
          widget.cardList.elementAt(it).nbPlayed.toDouble()));
      index += 1;
    }
    rawBarGroups[0] = groupData[0].skip(skip).take(width.toInt()).toList();
  }

  void sortByCheck() {
    int index = 0;
    widget.cardList.sort((a, b) {
      int value = b.nbCheck.compareTo(a.nbCheck);
      if (value == 0) {
        return -a.nbPlayed.compareTo(b.nbPlayed);
      }
      return value;
    });
    for (int it = 0; it < widget.cardList.length; it++) {
      if (it % width == 0) {
        index = 0;
      }
      groupData[1].add(makeGroupData(
          index,
          widget.cardList.elementAt(it).nbCheck.toDouble(),
          widget.cardList.elementAt(it).nbPlayed.toDouble()));
      index += 1;
    }
    rawBarGroups[1] = groupData[1].skip(skip).take(width.toInt()).toList();
    showingBarGroups = rawBarGroups[1];
  }

  void changePage(DragEndDetails detail) {
    if (detail.primaryVelocity! > 0.0) {
      if (skip >= width) {
        skip -= width.toInt();
      }
    } else {
      if (skip < widget.cardList.length - width) {
        skip += width.toInt();
      }
    }
    setState(() {
      rawBarGroups[sortIndex] =
          groupData[sortIndex].skip(skip).take(width.toInt()).toList();
      showingBarGroups = List.of(rawBarGroups[sortIndex]);
    });
  }

  void changeSort(final int index) {
    setState(() {
      sortIndex = index;
      showingBarGroups = rawBarGroups[sortIndex];
      skip = 0;
      rawBarGroups[sortIndex] =
          groupData[sortIndex].skip(skip).take(width.toInt()).toList();
      showingBarGroups = List.of(rawBarGroups[sortIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Container(
            height: 480,
            margin: EdgeInsets.only(top: 60),
            child: AspectRatio(
              aspectRatio: 0.9,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        makeTransactionsIcon(),
                        const SizedBox(
                          width: 38,
                        ),
                        const Text(
                          'Card',
                          style: TextStyle(fontSize: 22),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Expanded(
                      child: GestureDetector(
                          onHorizontalDragEnd: changePage,
                          child: BarChart(
                            BarChartData(
                              maxY: maxY.toDouble(),
                              barTouchData: BarTouchData(
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBgColor: Colors.grey,
                                  getTooltipItem: (a, b, c, d) => null,
                                ),
                              ),
                              titlesData: FlTitlesData(
                                show: true,
                                rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: bottomTitles,
                                    reservedSize: 70,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 28,
                                    interval: 1,
                                    getTitlesWidget: leftTitles,
                                  ),
                                ),
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              barGroups: showingBarGroups,
                              gridData: const FlGridData(show: false),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                            height: 35,
                            width: 175,
                            child: TextButton(
                                onPressed: () => {changeSort(0)},
                                child: Indicator(
                                  color: widget.appSettings.darkMode
                                      ? Colors.white
                                      : Colors.black87,
                                  text: 'Cartes proposées',
                                  isSquare: false,
                                  textColor:
                                      Theme.of(context).colorScheme.onSurface,
                                ))),
                        SizedBox(
                            height: 35,
                            width: 160,
                            child: TextButton(
                                onPressed: () => {changeSort(1)},
                                child: Indicator(
                                  color: Colors.indigo[300]!,
                                  text: 'Cartes validées',
                                  isSquare: false,
                                  textColor:
                                      Theme.of(context).colorScheme.onSurface,
                                ))),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final half = maxY / 2;
    final style = TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == half) {
      text = half.toInt().toString();
    } else if (value == maxY) {
      text = maxY.toString();
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final List<CardList> tmp =
        widget.cardList.skip(skip).take(width.toInt()).toList();
    final List<String> titles = tmp.map((e) => e.cardName).toList();
    final Widget text = Text(
      titles[value.toInt()],
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Container(
          margin: EdgeInsets.only(top: width),
          constraints: BoxConstraints(maxWidth: 75),
          child: text),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y2,
          color: widget.appSettings.darkMode ? Colors.white : Colors.black87,
          width: width,
        ),
        BarChartRodData(
          toY: y1,
          color: Colors.indigo[300],
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
        ),
      ],
    );
  }
}
