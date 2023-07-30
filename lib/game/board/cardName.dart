import '../../home/bingoTypeButton.dart';

enum plaqueTypeList { triangle, ronde, tortue, soleil, carrer, all, none }

class CardName {
  String name;
  plaqueTypeList plaqueType;
  List<BingoType> type;
  int difficulty;

  CardName(
      {required this.name,
      this.plaqueType = plaqueTypeList.none,
      required this.type,
      required this.difficulty});
}

List<CardName> cardNameListPlaque = [
  CardName(
      name: "Bus",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 3),
  CardName(
      name: "Kta star",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 3),
  CardName(
      name: "Copain",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 1),
  CardName(
      name: "Lampe allumée",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Touristes",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 1),
  CardName(
      name: "Regarde mais s'arrête pas",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Police",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 3),
  CardName(
      name: "Fermeture de plaque hasardeuse",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Dégonde la plaque",
      plaqueType: plaqueTypeList.triangle,
      type: [BingoType.plaque],
      difficulty: 2),
  CardName(
      name: "Claque la plaque",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Solitaire",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 1),
  CardName(
      name: "Arrive pas à ouvrir",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 2),
  CardName(
      name: "Galère à cause du sac",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 1),
  CardName(
      name: "Reste à côté de la plaque",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Fil d'attente",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 1),
  CardName(
      name: "Tir sur la mauvaise plaque",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Random qui s'arrête regarder",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Fifi tier",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 3),
  CardName(
      name: "Tir plaque original",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Couple / Duo",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 1),
  CardName(
      name: "Attent un pote",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 1),
  CardName(
      name: "Laisse la plaque ouverte",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 3),
  CardName(
      name: "Plaque ouverte +1min / pers",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Trop propre",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 1),
  CardName(
      name: "Discute à coté",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 1),
  CardName(
      name: "Discute plaque ouverte",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque],
      difficulty: 2),
  CardName(
      name: "Fusion de groupe",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 2),
  CardName(
      name: "Tous dans la même tenue",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.sousterrain],
      difficulty: 2),
  CardName(name: "Fumi", type: [BingoType.sousterrain], difficulty: 1),
  CardName(name: "Chantier", type: [BingoType.sousterrain], difficulty: 2),
  CardName(name: "Traquenar", type: [BingoType.sousterrain], difficulty: 1)
];
