import 'package:plaktago/home/bingo_type_button.dart';

class CardName {
  final String name;
  final List<BingoType> type;
  final String alcoolRule;
  final int nbShot;
  final String description;

  const CardName(
      {required this.name,
      required this.type,
      this.alcoolRule = "Boire un coup",
      this.nbShot = 1,
      this.description = ""});
}

List<CardName> cardNameListPlaque = [
  CardName(
      name: "Bus",
      type: [BingoType.plaque, BingoType.kta],
      description: "Groupe supérieure à 5 personnes"),
  CardName(
      name: "Kta star",
      type: [BingoType.plaque, BingoType.kta],
      description: "Ktaphile connu"),
  CardName(
    name: "Copain",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
      name: "Lampe allumée",
      type: [BingoType.plaque],
      description: "Laisse sa lampe allumée au dessus de la plaque"),
  CardName(
    name: "Touristes",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
      name: "Regarde mais s'arrête pas",
      type: [BingoType.plaque],
      description:
          "Cataphile en tenu qui regarde la plaque mais ne descend pas"),
  CardName(
      name: "Fermeture de plaque hasardeuse",
      type: [BingoType.plaque],
      description: "Galère à fermer la plaque / Fait du bruit"),
  CardName(
    name: "Claque la plaque",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Solitaire",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
      name: "Arrive pas à ouvrir",
      type: [BingoType.plaque],
      description: "Arrive pas à ouvrir la plaque"),
  CardName(
    name: "Galère à cause du sac",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
      name: "Reste à côté de la plaque",
      type: [BingoType.plaque],
      description: "Cataphile qui reste juste à coter de la plaque"),
  CardName(
    name: "File d'attente",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Tir sur la mauvaise plaque",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Random qui s'arrête regarder",
    type: [BingoType.plaque],
  ),
  CardName(
      name: "Autoroute / Fifi tier",
      type: [BingoType.plaque],
      description: "Grosse influence"),
  CardName(
    name: "Tir plaque original",
    type: [BingoType.plaque],
  ),
  CardName(
      name: "Couple / Duo",
      type: [BingoType.plaque, BingoType.kta],
      alcoolRule: "Boire 2 shot",
      nbShot: 1),
  CardName(
      name: "Attend un pote",
      type: [BingoType.plaque, BingoType.kta],
      alcoolRule: "Seul le pote bois un shot"),
  CardName(
    name: "Laisse la plaque ouverte",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Lent à descendre",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Trop propre",
    type: [BingoType.plaque, BingoType.kta],
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
      description: "Fusion de gens qui ne se connaissent pas"),
  CardName(
      name: "Tous dans la même tenue",
      type: [BingoType.plaque, BingoType.kta],
      alcoolRule: "Tous le monde bois le même alcool"),
  CardName(
    name: "Visiter 5 salles",
    type: [BingoType.exploration],
  ),
  CardName(
      name: "Prendre 7 chatière",
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
  CardName(
      name: "Traquenard",
      type: [BingoType.kta],
      description: "Changement de plan non voulu"),
  CardName(name: "Hamac", type: [BingoType.kta]),
  CardName(name: "Plan papier", type: [BingoType.kta]),
  CardName(name: "Galerie atypique", type: [BingoType.exploration]),
  CardName(
      name: 'Jamais vu',
      type: [BingoType.exploration],
      description: "Découverte d'un nouvelle endroit dans le réseau"),
  CardName(name: 'Belle épure', type: [BingoType.exploration]),
  CardName(name: "Hardtech de mauvais goût", type: [BingoType.kta])
];
