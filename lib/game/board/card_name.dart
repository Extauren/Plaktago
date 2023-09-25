import 'package:isar/isar.dart';
import '../../home/bingo_type_button.dart';

class CardName {
  final String name;
  final List<BingoType> type;
  final String alcoolRule;
  final int nbShot;

  const CardName(
      {required this.name,
      required this.type,
      this.alcoolRule = "Boire 1 shot",
      this.nbShot = 1});
}

List<CardName> cardNameListPlaque = [
  CardName(
    name: "Bus",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Kta star",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Copain",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Lampe allumée",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Touristes",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Regarde mais s'arrête pas",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Police",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Fermeture de plaque hasardeuse",
    type: [BingoType.plaque],
  ),
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
  ),
  CardName(
    name: "Galère à cause du sac",
    type: [BingoType.plaque, BingoType.kta],
  ),
  CardName(
    name: "Reste à côté de la plaque",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Fil d'attente",
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
    name: "Fifi tier",
    type: [BingoType.plaque],
  ),
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
  ),
  CardName(
    name: "Discute plaque ouverte",
    type: [BingoType.plaque],
  ),
  CardName(
    name: "Fusion de groupe",
    type: [BingoType.plaque, BingoType.kta],
  ),
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
  CardName(name: "Traquenard", type: [BingoType.kta]),
  CardName(name: "Hamac", type: [BingoType.kta]),
  CardName(name: "Plan papier", type: [BingoType.kta]),
  CardName(name: "Galerie atypique", type: [BingoType.exploration]),
  CardName(name: 'Jamais vu', type: [BingoType.exploration]),
  CardName(name: 'Belle épure', type: [BingoType.exploration])
];
