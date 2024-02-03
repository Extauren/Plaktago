import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:plaktago/components/app_bar.dart';
import 'package:plaktago/components/board.dart';
import 'package:plaktago/components/dialog.dart';
import 'package:plaktago/components/outlined_button.dart';
import 'package:plaktago/data_class/bingo_card.dart';
import 'package:plaktago/data_class/game.dart';
import 'package:plaktago/utils/get_icon.dart';
import 'package:plaktago/utils/isar_service.dart';

class GameStats extends StatefulWidget {
  final Game game;
  final IsarService isarService;
  final bool displayTimer;
  const GameStats(
      {Key? key,
      required this.game,
      required this.isarService,
      required this.displayTimer})
      : super(key: key);

  @override
  State<GameStats> createState() => _GameStats();
}

class _GameStats extends State<GameStats> {
  late double _sliderValue;
  late double _sliderMaxValue;
  String formatDate = "";

  @override
  void initState() {
    super.initState();
    List cardSelect = widget.game.bingoCards
        .where((element) => element.isSelect == true)
        .toList();
    if (cardSelect.length < 2) {
      _sliderMaxValue = 1.0;
    } else {
      BingoCard maxOrder = widget.game.bingoCards.reduce(
          (value, element) => value.order > element.order ? value : element);
      _sliderMaxValue = double.parse(maxOrder.order.toString());
    }
    _sliderValue = _sliderMaxValue;
    getDate();
  }

  void getDate() {
    List<int> dateNumber = [];

    initializeDateFormatting('fr');
    final dateTimeFormat = DateFormat.yMMMMd("fr");
    List<String> dateList = widget.game.date.split('/');
    for (int i = 0; i < dateList.length; i++) {
      dateNumber.add(int.parse(dateList[i]));
    }
    formatDate = dateTimeFormat
        .format(DateTime(dateNumber[2], dateNumber[1], dateNumber[0]));
  }

  void deleteGame() async {
    widget.isarService.deleteGame(widget.game.id, widget.game.bingoType,
        widget.game.points, widget.game.nbLines);
    Navigator.pop(context);
  }

  void checkDeleteGame() {
    PDialog(
            context: context,
            title: "Supprimer la partie",
            desc: "Voulez vous vraiment supprimer cette partie ?",
            bntOkOnPress: deleteGame)
        .show();
  }

  void setGameToFavorite() {
    widget.game.favorite = !widget.game.favorite;
    setState(() {
      widget.isarService.updateGame(widget.game);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PAppBar(
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            getIcon(widget.game.bingoType),
            Text(widget.game.bingoType.name),
            Text(widget.game.date)
          ]),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: setGameToFavorite,
                  icon: Icon(
                    widget.game.favorite
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    color: Color.fromRGBO(242, 48, 48, 1),
                    size: 28,
                  ),
                )),
          ],
        ),
        body: ListView(children: [
          // Center(
          //     child: Container(
          //         margin: EdgeInsets.only(top: 20),
          //         child: Text(
          //           formatDate,
          //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          //         ))),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.displayTimer)
                      ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width / 2,
                          ),
                          child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(
                                      width: 1.5,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary)),
                              child: Center(
                                  child: Text(
                                widget.game.time,
                                style: const TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              )))),
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2,
                        ),
                        child: Container(
                            margin: EdgeInsets.only(
                                left: widget.displayTimer ? 50 : 0),
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 50,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    border: Border.all(
                                        width: 1.5,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Points : ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          widget.game.points.toString(),
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400),
                                        ))
                                  ],
                                ))))
                  ])),
          Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height / 1.74,
              constraints: BoxConstraints(maxWidth: 450, maxHeight: 520),
              child: PBoard(
                bingoCard: widget.game.bingoCards,
                writePerm: false,
                sliderValue: _sliderValue,
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Slider(
                min: 0.0,
                max: _sliderMaxValue,
                value: _sliderValue,
                divisions: _sliderMaxValue.toInt(),
                inactiveColor: Theme.of(context).colorScheme.surface,
                thumbColor: Theme.of(context).colorScheme.primary,
                activeColor: Theme.of(context).cardColor,
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Theme.of(context).colorScheme.surface),
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              )),
          POutlinedButton(
              label: "Supprimer la partie",
              onPressed: checkDeleteGame,
              iconData: Icons.delete,
              margin: EdgeInsets.only(top: 20, bottom: 10)),
        ]));
  }
}
