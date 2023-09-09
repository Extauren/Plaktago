import '../../home/bingo_type_button.dart';

enum plaqueTypeList { triangle, ronde, carrer, all, none }

class CardName {
  final String name;
  final plaqueTypeList plaqueType;
  final List<BingoType> type;
  final String alcoolRule;
  final int nbShot;

  const CardName(
      {required this.name,
      this.plaqueType = plaqueTypeList.none,
      required this.type,
      this.alcoolRule = "Boire 1 shot",
      this.nbShot = 1});
}

List<CardName> cardNameListPlaque = [
  CardName(
    name: "Bus",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Kta star",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Copain",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Lampe allumée",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Touristes",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Regarde mais s'arrête pas",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Police",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Fermeture de plaque hasardeuse",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Claque la plaque",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Solitaire",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Arrive pas à ouvrir",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Galère à cause du sac",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta], //balade
  ),
  CardName(
    name: "Reste à côté de la plaque",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Fil d'attente",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Tir sur la mauvaise plaque",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Random qui s'arrête regarder",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Fifi tier",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Tir plaque original",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
      name: "Couple / Duo",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.kta],
      alcoolRule: "Boire 2 shot",
      nbShot: 1),
  CardName(
      name: "Attend un pote",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.kta],
      alcoolRule: "Seul le pote bois un shot"),
  CardName(
    name: "Laisse la plaque ouverte",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Plaque ouverte +1min / pers",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Trop propre",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Discute à coté",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Discute plaque ouverte",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Fusion de groupe",
    plaqueType: plaqueTypeList.all,
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
      name: "Tous dans la même tenue",
      plaqueType: plaqueTypeList.all,
      type: [BingoType.plaque, BingoType.kta],
      alcoolRule: "Tous le monde bois le même alcool"),
  CardName(
    name: "Visiter 5 salles",
    type: [BingoType.exploration],
  ),
  CardName(
      name: "Prendre 10 chatière",
      type: [BingoType.exploration],
      alcoolRule: "Boire un shot allongé"),
  CardName(
      name: "Repas / Apéro",
      type: [BingoType.kta],
      alcoolRule: "Boire un shot avec les gens de l'apéro"),
  CardName(
      name: "Fumi", type: [BingoType.kta], alcoolRule: "Boire sans lumière"),
  CardName(
      name: "Perdu",
      type: [BingoType.kta],
      alcoolRule: "Boire un shot d'eau",
      nbShot: 0),
  CardName(name: "Chantier", type: [BingoType.kta]),
  CardName(name: "Traquenard", type: [BingoType.kta]),
  CardName(name: "Hamac", type: [BingoType.kta]),
];
