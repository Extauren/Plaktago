import 'package:fl_chart/fl_chart.dart';
import 'package:plaktago/home/bingo_type_button.dart';
import 'indicator.dart';
import 'package:flutter/material.dart';

class Pourcentage extends StatefulWidget {
  final String nbGames;
  final String bingoPlaque;
  final String bingoKta;
  final String bingoExplo;
  const Pourcentage(
      {super.key,
      required this.nbGames,
      required this.bingoPlaque,
      required this.bingoKta,
      required this.bingoExplo});

  @override
  State<StatefulWidget> createState() => _Pourcentage();
}

class _Pourcentage extends State<Pourcentage> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Align(
        child: SizedBox(
            width: 400,
            child: AspectRatio(
              aspectRatio: 2.0,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
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
                        centerSpaceRadius: 35,
                        sections: showingSections(),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
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
                            color: Color.fromRGBO(195, 176, 129, 1),
                            text: 'KTA',
                            isSquare: false,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Indicator(
                            color: Colors.green,
                            text: BingoType.exploration.name,
                            isSquare: false,
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            )));
  }

  List<PieChartSectionData> showingSections() {
    final double plaquePourcentage =
        int.parse(widget.bingoPlaque) / int.parse(widget.nbGames) * 100;
    final double ktaPourcentage =
        int.parse(widget.bingoKta) / int.parse(widget.nbGames) * 100;
    final double exploPourcentage =
        int.parse(widget.bingoExplo) / int.parse(widget.nbGames) * 100;

    return List.generate(3, (i) {
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
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Color.fromRGBO(195, 176, 129, 1),
            value: ktaPourcentage,
            title: "${ktaPourcentage.round().toString()} %",
            radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.green[600],
            value: exploPourcentage,
            title: "${exploPourcentage.round().toString()} %",
            radius: radius,
            titleStyle: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
