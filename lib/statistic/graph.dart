import 'package:fl_chart/fl_chart.dart';
import './indicator.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatefulWidget {
  final String nbGames;
  final String bingoPlaque;
  final String bingoRat;
  const PieChartSample2(
      {super.key,
      required this.nbGames,
      required this.bingoPlaque,
      required this.bingoRat});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: Colors.indigo[300]!,
                text: 'Plaque',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: Color.fromRGBO(208, 118, 89, 1),
                text: 'Sous terrain',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final double plaquePourcentage =
        int.parse(widget.bingoPlaque) / int.parse(widget.nbGames) * 100;
    final double ratPourcentage =
        int.parse(widget.bingoRat) / int.parse(widget.nbGames) * 100;

    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.indigo[300],
            value: plaquePourcentage,
            title: "${plaquePourcentage.round().toString()} %",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              //color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Color.fromRGBO(208, 118, 89, 1),
            value: ratPourcentage,
            title: "${ratPourcentage.round().toString()} %",
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              //color: AppColors.mainTextColor1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
