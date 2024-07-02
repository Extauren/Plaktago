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
  CardName(name: "Percée", type: [BingoType.kta], description: "Bière percée / bouteille cassée"),
  CardName(name: "Quiproquo", type: [BingoType.kta], icon: "0xe540", description: "Quelqu'un confond une personne avec quelqu'un d'autre/ Erreur de blase (en vrai pas en discussion)"),
  CardName(name: "Baisse pas sa lampe", type: [BingoType.kta], icon: "0xf0eb", description: "Personne éblouissant les autres avec sa lumière"),
  CardName(name: "Déchet / Poubelle", type: [BingoType.kta], icon: "0xf2ed", description: "Déchet ou poubelle dans une salle ou galerie"),
  //CardName(name: "Ktasnob", type: [BingoType.kta], description: "Ktaphile snob"),
  CardName(name: "Enceinte à fond", type: [BingoType.kta], icon: "0xf028", description: "Musique trop forte / baisse pas la musique quand il passe devant"),
  CardName(name: "Taggeur", type: [BingoType.kta], icon: "0xf5bd", description: "Personne en train de tagger ou odeur de bombe dans une galerie"),
  CardName(name: "Bourré / Défoncé", type: [BingoType.kta], icon: "0xf0fc", description: "Quelqu'un de bourré ou défoncé"),
  CardName(name: "Animal domestic", type: [BingoType.kta], icon: "0xf6d3", description: "Animal domestique descendu par une personne"),
  CardName(name: "Mauvaise fois", type: [BingoType.kta], description: "Négocie les règles du Bingo"),
  CardName(name: "Ktaphile startup pack", type: [BingoType.kta], icon: "0xf11e", description: "Cuissarde / Acet / Armytek / JBLxtreme / Kit"),
  CardName(name: "Débat nul", type: [BingoType.kta], icon: "0xf086", description: "Débat sans intérêt"),
  CardName(name: "Bus",type: [BingoType.plaque, BingoType.kta],icon: "0xe533",description: "Groupe supérieur à 5 personnes"),
  CardName(name: "Kta star",type: [BingoType.plaque, BingoType.kta],icon: "0xf445",description: "Ktaphile connu", difficulty: Difficulty.medium),
  CardName(name: "Copain", type: [BingoType.plaque, BingoType.kta], icon: "0xf234", description: "Ami qui n'était pas prévu"),
  CardName(name: "Lampe allumée",type: [BingoType.plaque],icon: "0xf0eb", description: "Laisse sa lampe allumée au-dessus de la plaque"),
  CardName(name: "Touristes",type: [BingoType.plaque, BingoType.kta],icon: "0xf6ec", description: "Personne qui ne descend pas souvent", difficulty: Difficulty.easy),
  CardName(name: "Regarde mais s'arrête pas",type: [BingoType.plaque],icon: "0xf554",description: "Ktaphile en tenue qui regarde la plaque mais ne descend pas"),
  CardName(name: "Galère à fermer la plaque",type: [BingoType.plaque],description: "Galère à fermer la plaque / fait du bruit"),
  CardName(name: "Claque la plaque",type: [BingoType.plaque], description: "Bruit excédant 80 db", difficulty: Difficulty.medium),
  CardName(name: "Solitaire",type: [BingoType.plaque, BingoType.kta],icon: "0xf406", description: "Personne seul", difficulty: Difficulty.easy),
  CardName(name: "Arrive pas à ouvrir",type: [BingoType.plaque],icon: "0xf29d",description: "Arrive pas à ouvrir la plaque"),
  CardName(name: "Galère à cause du sac",type: [BingoType.plaque, BingoType.kta],icon: "0xf290", description: "Sac qui coince à la plaque ou dans une chatière", difficulty: Difficulty.hard),
  CardName(name: "Reste à côté de la plaque",type: [BingoType.plaque],description: "Ktaphile qui reste à côté de la plaque"),
  CardName(name: "File d'attente",icon: "0xe592",type: [BingoType.plaque, BingoType.kta], description: "Temps d'attente à une chatière ou à une plaque", difficulty: Difficulty.easy),
  CardName(name: "Tir sur la mauvaise plaque",type: [BingoType.plaque]),
  CardName(name: "Random qui s'arrête regarder",type: [BingoType.plaque],icon: "0xf06e"),
  CardName(name: "Autoroute / Fifi tier",type: [BingoType.plaque],icon: "0xf018",description: "Grosse influence"),
  CardName(name: "Tir plaque original",type: [BingoType.plaque],),
  CardName(name: "Couple / Duo",type: [BingoType.plaque, BingoType.kta],icon: "0xf500", description: "Deux personnes ensemble", difficulty: Difficulty.easy),
  CardName(name: "Attend un pote",type: [BingoType.plaque, BingoType.kta], description: "Copain en retard", difficulty: Difficulty.easy),
  CardName(name: "Plaque longtemps ouverte",type: [BingoType.plaque]),
  CardName(name: "Lent à descendre",type: [BingoType.plaque]),
  CardName(name: "Trop propre",type: [BingoType.plaque, BingoType.kta],icon: "0xe05d", description: "Habit pas sale ou lavé", difficulty: Difficulty.medium),
  CardName(name: "Discute à coté",type: [BingoType.plaque],description: "Discute à côté de la plaque"),
  CardName(name: "Discute plaque ouverte",type: [BingoType.plaque],),
  CardName(name: "Fusion de groupe",type: [BingoType.plaque, BingoType.kta],icon: "0xe068",description: "Deux groupes qui squattent / bougent ensemble", difficulty: Difficulty.easy),
  CardName(name: "Tous dans la même tenue",type: [BingoType.plaque, BingoType.kta],icon: "0xf508", description: "Personnes habilé de la même façon ou dans un même thème", difficulty: Difficulty.hard),
  CardName(name: "Repas",type: [BingoType.kta],icon: "0xf2e7", description: "Repas partagé consistant et/ou cuisine élaborée, différent sandwich, houmous, etc"),
  CardName(name: "Apéro", type: [BingoType.kta], icon: "0xe4c6", description: "Une bière et des trucs à partager"),
  CardName(name: "Fumi",type: [BingoType.kta],icon: "0xf75f", description: "Tu vois pas devant toi", difficulty: Difficulty.medium),
  CardName(name: "Perdu",type: [BingoType.kta],icon: "0xe551", description: "Personne ne sachant pas où elle se trouve", difficulty: Difficulty.medium),
  CardName(name: "Chantier", type: [BingoType.kta], icon: "0xf85e"),
  CardName(name: "Traquenard",type: [BingoType.kta],icon: "0xe535",description: "Changement / nouveau plan qui fait remonter plus tard", difficulty: Difficulty.easy),
  CardName(name: "Hamac", type: [BingoType.kta], description: "Présence d'un hamac installé quelqu'il soit", difficulty: Difficulty.easy),
  CardName(name: "Plan papier", type: [BingoType.kta], icon: "0xf279", description: "Objet tangible qui représente le réseau", difficulty: Difficulty.hard),
  CardName(name: "Hardtech de mauvais goût", type: [BingoType.kta], icon: "0xf001", description: "Musique électronique trop fort", difficulty: Difficulty.easy)
];
