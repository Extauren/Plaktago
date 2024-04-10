import 'package:plaktago/home/bingo_type_button.dart';

class CardName {
  final String name;
  final List<BingoType> type;
  final String? icon;
  final String alcoolRule;
  final int nbShot;
  final String description;

  const CardName(
      {required this.name,
      required this.type,
      this.icon,
      this.alcoolRule = "Boire un coup",
      this.nbShot = 1,
      this.description = ""});
}

List<CardName> cardNameListPlaque = [
  CardName(
      name: "Bus",
      type: [BingoType.plaque, BingoType.kta],
      icon: "0xe533",
      description: "Groupe supérieure à 5 personnes"),
  CardName(
      name: "Kta star",
      type: [BingoType.plaque, BingoType.kta],
      icon: "0xf445",
      description: "Ktaphile connu"),
  CardName(
      name: "Copain", type: [BingoType.plaque, BingoType.kta], icon: "0xf234"),
  CardName(
      name: "Lampe allumée",
      type: [BingoType.plaque],
      description: "Laisse sa lampe allumée au dessus de la plaque",
      icon: "0xf0eb"),
  CardName(
      name: "Touristes",
      type: [BingoType.plaque, BingoType.kta],
      icon: "0xf6ec"),
  CardName(
      name: "Regarde mais s'arrête pas",
      type: [BingoType.plaque],
      icon: "0xf554",
      description:
          "Cataphile en tenu qui regarde la plaque mais ne descend pas"),
  CardName(
      name: "Galère à fermer la plaque",
      type: [BingoType.plaque],
      description: "Galère à fermer la plaque / Fait du bruit"),
  CardName(
    name: "Claque la plaque",
    type: [BingoType.plaque],
  ),
  CardName(
      name: "Solitaire",
      type: [BingoType.plaque, BingoType.kta],
      icon: "0xf406"),
  CardName(
      name: "Arrive pas à ouvrir",
      type: [BingoType.plaque],
      icon: "0xf29d",
      description: "Arrive pas à ouvrir la plaque"),
  CardName(
      name: "Galère à cause du sac",
      type: [BingoType.plaque, BingoType.kta],
      icon: "0xf290"),
  CardName(
      name: "Reste à côté de la plaque",
      type: [BingoType.plaque],
      description: "Cataphile qui reste à coter de la plaque"),
  CardName(
    name: "File d'attente",
    icon: "0xe592",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Tir sur la mauvaise plaque",
    type: [BingoType.plaque],
  ),
  CardName(
      name: "Random qui s'arrête regarder",
      type: [BingoType.plaque],
      icon: "0xf06e"),
  CardName(
      name: "Autoroute / Fifi tier",
      type: [BingoType.plaque],
      icon: "0xf018",
      description: "Grosse influence"),
  CardName(
    name: "Tir plaque original",
    type: [BingoType.plaque],
  ),
  CardName(
      name: "Couple / Duo",
      type: [BingoType.plaque, BingoType.kta],
      icon: "0xf500", //"0xe068",
      alcoolRule: "Boire 2 shot",
      nbShot: 1),
  CardName(
      name: "Attend un pote",
      type: [BingoType.plaque, BingoType.kta],
      alcoolRule: "Seul le pote bois un shot"),
  CardName(
    name: "Plaque longtemps ouverte",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Lent à descendre",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Trop propre",
    type: [BingoType.plaque, BingoType.kta],
    icon: "0xe05d",
  ),
  CardName(
      name: "Discute à coté",
      type: [BingoType.plaque],
      description: "Discute à coter de la plaque"),
  CardName(
    name: "Discute plaque ouverte",
    type: [BingoType.plaque],
  ),
  CardName(
      name: "Fusion de groupe",
      type: [BingoType.plaque, BingoType.kta],
      icon: "0xe068",
      description: "Fusion de gens qui ne se connaissent pas"),
  CardName(
      name: "Tous dans la même tenue",
      type: [BingoType.plaque, BingoType.kta],
      icon: "0xf508",
      alcoolRule: "Tous le monde bois le même alcool"),
  CardName(
    name: "Visiter 5 salles",
    type: [BingoType.exploration],
    icon: "0x35",
  ),
  CardName(
      name: "Prendre 7 chatière",
      type: [BingoType.exploration],
      icon: '0x37',
      alcoolRule: "Boire un shot allongé"),
  CardName(
      name: "Repas / Apéro",
      type: [BingoType.kta],
      icon: "0xe4c6",
      alcoolRule: "Boire un shot avec les gens de l'apéro"),
  CardName(
      name: "Fumi",
      type: [BingoType.kta],
      icon: "0xf75f",
      alcoolRule: "Boire sans lumière"),
  CardName(
      name: "Perdu",
      type: [BingoType.kta],
      icon: "0xe551",
      alcoolRule: "Boire un shot d'eau",
      nbShot: 0),
  CardName(name: "Chantier", type: [BingoType.kta], icon: "0xf85e"),
  CardName(
      name: "Traquenard",
      type: [BingoType.kta],
      icon: "0xe535",
      description: "Changement de plan non voulu"),
  CardName(name: "Hamac", type: [BingoType.kta]),
  CardName(name: "Plan papier", type: [BingoType.kta], icon: "0xf279"),
  CardName(name: "Galerie atypique", type: [BingoType.exploration]),
  CardName(
      name: 'Jamais vu',
      type: [BingoType.exploration],
      description: "Découverte d'un nouvelle endroit dans le réseau"),
  CardName(name: 'Belle épure', type: [BingoType.exploration]),
  CardName(
      name: "Hardtech de mauvais goût", type: [BingoType.kta], icon: "0xf001")
];
