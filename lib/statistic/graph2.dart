//import 'package:fl_chart_app/presentation/resources/app_resources.dart';
//import 'package:fl_chart_app/util/extensions/color_extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utils/saveGame.dart';

class BarChartSample2 extends StatefulWidget {
  final List<CardList> cardList;
  BarChartSample2({super.key, required this.cardList});
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 5;
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  List<BarChartGroupData> groupData = [];
  int skip = 0;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    int index = 0;
    widget.cardList.sort((a, b) => b.nbCheck.compareTo(a.nbCheck));
    for (int it = 0; it < widget.cardList.length; it++) {
      if (it % 5 == 0) {
        index = 0;
      }
      groupData.add(makeGroupData(
          index,
          widget.cardList.elementAt(it).nbCheck.toDouble(),
          widget.cardList.elementAt(it).nbPlayed.toDouble()));
      index += 1;
    }
    rawBarGroups = groupData.skip(skip).take(5).toList();
    showingBarGroups = rawBarGroups;
  }

  void test1(DragEndDetails detail) {
    if (detail.primaryVelocity! > 0.0) {
      if (skip >= 5) {
        skip -= 5;
      }
    } else {
      if (skip < widget.cardList.length - 5) {
        skip += 5;
      }
    }
    setState(() {
      rawBarGroups = groupData.skip(skip).take(5).toList();
      showingBarGroups = List.of(rawBarGroups);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                  style: TextStyle(color: Colors.white, fontSize: 22),
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
                  onHorizontalDragEnd: test1,
                  child: BarChart(
                    BarChartData(
                      maxY: widget.cardList[0].nbPlayed.toDouble(),
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
                            reservedSize: 60,
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
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final test = widget.cardList[0].nbPlayed / 2;
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == test) {
      text = test.toString();
    } else if (value == widget.cardList[0].nbPlayed) {
      text = widget.cardList[0].nbPlayed.toString();
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
    final List<CardList> tmp = widget.cardList.skip(skip).take(5).toList();
    final List<String> titles = tmp.map((e) => e.cardName).toList();
    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Container(
          margin: EdgeInsets.only(left: 0),
          constraints: BoxConstraints(maxWidth: 65),
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
          color: Colors.indigo[300], //Theme.of(context).colorScheme.secondary,
          width: width,
        ),
        BarChartRodData(
          toY: y1,
          color: Color.fromRGBO(
              208, 118, 89, 1), //Theme.of(context).colorScheme.primary,
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
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
