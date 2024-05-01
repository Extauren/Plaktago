import 'package:plaktago/home/bingo_type_button.dart';

enum Difficulty {
  easy("Facile"),
  medium("Moyen"),
  hard("Dur");

  const Difficulty(this.name);
  final String name;
}

class CardName {
  final String name;
  final List<BingoType> type;
  final String? icon;
  final String description;
  final Difficulty difficulty;

  const CardName(
      {required this.name,
      required this.type,
      this.icon,
      this.description = "",
      this.difficulty = Difficulty.easy});
}

List<CardName> cardNameListPlaque = [
  CardName(name: "Baisse pas sa lampe", type: [BingoType.kta], description: "Personne éblouissant les autres avec sa lumière"),
  CardName(name: "Déchet / Poubelle", type: [BingoType.kta], description: "Déchet ou poubelle dans une salle ou galerie"),
  CardName(name: "Ktasnob", type: [BingoType.kta], description: "Ktaphile snob"),
  CardName(name: "Enceinte à fond", type: [BingoType.kta], description: "Musique trop forte / baisse pas la musique quand il passe devant"),
  CardName(name: "Tageur / Odeur de bombe", type: [BingoType.kta], description: "Personne en train de tagger ou ordeur de bomb dans une galerie"),
  CardName(name: "Bourré / Défoncé", type: [BingoType.kta], description: "Quelqu'un de trop bourré ou défoncé"),
  CardName(name: "Animal domestic", type: [BingoType.kta], description: "Animal domestic descendus par une personne"),
  CardName(name: "Mauvaise fois", type: [BingoType.kta], description: "Une personne de mauvaise fois"),
  CardName(name: "Ktaphile startup pack", type: [BingoType.kta], description: "Cuissarde / Acet / Armytek / JBLxtreme / Kit"),
  CardName(name: "Débat nul", type: [BingoType.kta], description: "Débat sans intérêt"),
  CardName(name: "Bus",type: [BingoType.plaque, BingoType.kta],icon: "0xe533",description: "Groupe supérieure à 5 personnes"),
  CardName(name: "Kta star",type: [BingoType.plaque, BingoType.kta],icon: "0xf445",description: "Ktaphile connu", difficulty: Difficulty.medium),
  CardName(name: "Copain", type: [BingoType.plaque, BingoType.kta], icon: "0xf234"),
  CardName(name: "Lampe allumée",type: [BingoType.plaque],description: "Laisse sa lampe allumée au dessus de la plaque",icon: "0xf0eb"),
  CardName(name: "Touristes",type: [BingoType.plaque, BingoType.kta],icon: "0xf6ec", description: "Personne qui ne descend pas souvent", difficulty: Difficulty.easy),
  CardName(name: "Regarde mais s'arrête pas",type: [BingoType.plaque],icon: "0xf554",description: "Cataphile en tenu qui regarde la plaque mais ne descend pas"),
  CardName(name: "Galère à fermer la plaque",type: [BingoType.plaque],description: "Galère à fermer la plaque / Fait du bruit"),
  CardName(name: "Claque la plaque",type: [BingoType.plaque], description: "Bruit excédant 80 db", difficulty: Difficulty.medium),
  CardName(name: "Solitaire",type: [BingoType.plaque, BingoType.kta],icon: "0xf406", description: "Personne toute seul", difficulty: Difficulty.easy),
  CardName(name: "Arrive pas à ouvrir",type: [BingoType.plaque],icon: "0xf29d",description: "Arrive pas à ouvrir la plaque"),
  CardName(name: "Galère à cause du sac",type: [BingoType.plaque, BingoType.kta],icon: "0xf290", description: "Sac qui coince à la plaque ou dans une chatière", difficulty: Difficulty.hard),
  CardName(name: "Reste à côté de la plaque",type: [BingoType.plaque],description: "Cataphile qui reste à coter de la plaque"),
  CardName(name: "File d'attente",icon: "0xe592",type: [BingoType.plaque, BingoType.kta], description: "Temps d'attente à une chatière ou à une plaque", difficulty: Difficulty.easy),
  CardName(name: "Tir sur la mauvaise plaque",type: [BingoType.plaque]),
  CardName(name: "Random qui s'arrête regarder",type: [BingoType.plaque],icon: "0xf06e"),
  CardName(name: "Autoroute / Fifi tier",type: [BingoType.plaque],icon: "0xf018",description: "Grosse influence"),
  CardName(name: "Tir plaque original",type: [BingoType.plaque],),
  CardName(name: "Couple / Duo",type: [BingoType.plaque, BingoType.kta],icon: "0xf500", description: "Deux personnes ensemble", difficulty: Difficulty.easy),
  CardName(name: "Attend un pote",type: [BingoType.plaque, BingoType.kta], description: "Copain en retard", difficulty: Difficulty.easy),
  CardName(name: "Plaque longtemps ouverte",type: [BingoType.plaque],),
  CardName(name: "Lent à descendre",type: [BingoType.plaque],),
  CardName(name: "Trop propre",type: [BingoType.plaque, BingoType.kta],icon: "0xe05d", description: "Habit pas sale / lavé", difficulty: Difficulty.medium),
  CardName(name: "Discute à coté",type: [BingoType.plaque],description: "Discute à coter de la plaque"),
  CardName(name: "Discute plaque ouverte",type: [BingoType.plaque],),
  CardName(name: "Fusion de groupe",type: [BingoType.plaque, BingoType.kta],icon: "0xe068",description: "FDeux groupe qui squatte / bouge ensemble", difficulty: Difficulty.easy),
  CardName(name: "Tous dans la même tenue",type: [BingoType.plaque, BingoType.kta],icon: "0xf508", description: "Personnes habilé de la même façcon ou dans un même thème", difficulty: Difficulty.hard),
  CardName(name: "Repas / Apéro",type: [BingoType.kta],icon: "0xe4c6"),
  CardName(name: "Fumi",type: [BingoType.kta],icon: "0xf75f", description: "Tu vois pas devant toi", difficulty: Difficulty.medium),
  CardName(name: "Perdu",type: [BingoType.kta],icon: "0xe551", description: "Personne ne sachant pas ou elle se trouve", difficulty: Difficulty.medium),
  CardName(name: "Chantier", type: [BingoType.kta], icon: "0xf85e"),
  CardName(name: "Traquenard",type: [BingoType.kta],icon: "0xe535",description: "Changement / nouveau plan qui fait remonter plus tard", difficulty: Difficulty.easy),
  CardName(name: "Hamac", type: [BingoType.kta], description: "Présence d'un hamc installé quelqu'il soit", difficulty: Difficulty.easy),
  CardName(name: "Plan papier", type: [BingoType.kta], icon: "0xf279", description: "Objet tangible qui représente le réseau", difficulty: Difficulty.hard),
  CardName(name: "Hardtech de mauvais goût", type: [BingoType.kta], icon: "0xf001", description: "Musique électronique trop fort", difficulty: Difficulty.easy)
];
