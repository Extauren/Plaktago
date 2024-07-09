import 'package:plaktago/home/bingo_type_button.dart';

enum Difficulty {
  easy("Facile"),
  medium("Moyen"),
  hard("Difficile"),
  unknow("Null");

  const Difficulty(this.name);
  final String name;
}

class CardName {
  final String name;
  final List<BingoType> type;
  final String? icon;
  final String description;
  final Difficulty difficulty;
  final List<String>? excludes;

  const CardName({
    required this.name,
    required this.type,
    this.icon,
    this.description = "",
    this.difficulty = Difficulty.easy,
    this.excludes
  });
}

List<CardName> cardNameListPlaque = [
  CardName(name: "Percée", type: [BingoType.kta], description: "Bière percée / bouteille cassée", difficulty: Difficulty.medium),
  CardName(name: "Quiproquo", type: [BingoType.kta], icon: "0xe540", description: "Quelqu'un confond une personne avec quelqu'un d'autre/ Erreur de blase (en vrai pas en discussion)", difficulty: Difficulty.hard),
  CardName(name: "Baisse pas sa lampe", type: [BingoType.kta], icon: "0xf0eb", description: "Personne éblouissant les autres avec sa lumière", difficulty: Difficulty.easy),
  CardName(name: "Déchet / Poubelle", type: [BingoType.kta], icon: "0xf2ed", description: "Déchet ou poubelle dans une salle ou galerie", difficulty: Difficulty.easy),
  //CardName(name: "Ktasnob", type: [BingoType.kta], description: "Ktaphile snob"),
  CardName(name: "Enceinte à fond", type: [BingoType.kta], icon: "0xf028", description: "Musique trop forte / baisse pas la musique quand il passe devant", difficulty: Difficulty.easy, excludes: ["Hardtech de mauvais goût"]),
  CardName(name: "Taggeur", type: [BingoType.kta], icon: "0xf5bd", description: "Personne en train de tagger ou odeur de bombe dans une galerie", difficulty: Difficulty.medium),
  CardName(name: "Bourré / Défoncé", type: [BingoType.kta], icon: "0xf0fc", description: "Quelqu'un de bourré ou défoncé", difficulty: Difficulty.medium),
  CardName(name: "Animal domestic", type: [BingoType.kta], icon: "0xf6d3", description: "Animal domestique descendu par une personne", difficulty: Difficulty.medium),
  CardName(name: "Mauvaise fois", type: [BingoType.kta], description: "Négocie les règles du Bingo", difficulty: Difficulty.easy),
  // CardName(name: "Ktaphile startup pack", type: [BingoType.kta], icon: "0xf11e", description: "Cuissarde / Acet / Armytek / JBLxtreme / Kit"),
  CardName(name: "Débat nul", type: [BingoType.kta], icon: "0xf086", description: "Débat sans intérêt", difficulty: Difficulty.easy),
  CardName(name: "Bus",type: [ BingoType.kta, BingoType.plaque],icon: "0xe533",description: "Groupe supérieur à 5 personnes", difficulty: Difficulty.medium),
  CardName(name: "Kta star",type: [BingoType.kta, BingoType.plaque],icon: "0xf445",description: "Ktaphile connu", difficulty: Difficulty.medium),
  CardName(name: "Copain", type: [BingoType.kta, BingoType.plaque], icon: "0xf234", description: "Ami qui n'était pas prévu", difficulty: Difficulty.medium),
  CardName(name: "Lampe allumée",type: [BingoType.plaque],icon: "0xf0eb", description: "Laisse sa lampe allumée au-dessus de la plaque", difficulty: Difficulty.easy),
  CardName(name: "Touristes",type: [BingoType.kta, BingoType.plaque],icon: "0xf6ec", description: "Personne qui ne descend pas souvent", difficulty: Difficulty.easy),
  CardName(name: "Regarde mais s'arrête pas",type: [BingoType.plaque],icon: "0xf554",description: "Ktaphile en tenue qui regarde la plaque mais ne descend pas", difficulty: Difficulty.easy),
  CardName(name: "Galère à fermer la plaque",type: [BingoType.plaque],description: "Galère à fermer la plaque / fait du bruit", difficulty: Difficulty.medium),
  CardName(name: "Claque la plaque",type: [BingoType.plaque], description: "Bruit excédant 80 db", difficulty: Difficulty.medium),
  CardName(name: "Solitaire",type: [BingoType.plaque, BingoType.kta],icon: "0xf406", description: "Personne seul", difficulty: Difficulty.easy),
  CardName(name: "Arrive pas à ouvrir",type: [BingoType.plaque],icon: "0xf29d",description: "Arrive pas à ouvrir la plaque", difficulty: Difficulty.hard),
  CardName(name: "Galère à cause du sac",type: [BingoType.kta, BingoType.plaque],icon: "0xf290", description: "Sac qui coince à la plaque ou dans une chatière", difficulty: Difficulty.hard),
  CardName(name: "Reste à côté de la plaque",type: [BingoType.plaque],description: "Ktaphile qui reste à côté de la plaque", difficulty: Difficulty.medium),
  CardName(name: "File d'attente",icon: "0xe592",type: [BingoType.plaque, BingoType.kta], description: "Temps d'attente à une chatière ou à une plaque", difficulty: Difficulty.easy),
  CardName(name: "Tir sur la mauvaise plaque",type: [BingoType.plaque], difficulty: Difficulty.hard),
  CardName(name: "Random qui s'arrête regarder",type: [BingoType.plaque],icon: "0xf06e", difficulty: Difficulty.medium),
  CardName(name: "Autoroute / Fifi tier", type: [BingoType.plaque], icon: "0xf018", description: "Grosse influence", difficulty: Difficulty.medium),
  CardName(name: "Tir plaque original",type: [BingoType.plaque], difficulty: Difficulty.medium),
  CardName(name: "Couple / Duo",type: [BingoType.kta, BingoType.plaque],icon: "0xf500", description: "Deux personnes ensemble", difficulty: Difficulty.easy),
  CardName(name: "Attend un pote",type: [BingoType.kta, BingoType.plaque], description: "Copain en retard", difficulty: Difficulty.easy),
  CardName(name: "Plaque longtemps ouverte",type: [BingoType.plaque], difficulty: Difficulty.hard),
  CardName(name: "Lent à descendre",type: [BingoType.plaque], difficulty: Difficulty.easy),
  CardName(name: "Trop propre",type: [BingoType.kta, BingoType.plaque],icon: "0xe05d", description: "Habit pas sale ou lavé", difficulty: Difficulty.medium),
  CardName(name: "Discute à coté",type: [BingoType.plaque],description: "Discute à côté de la plaque", difficulty: Difficulty.medium),
  CardName(name: "Discute plaque ouverte",type: [BingoType.plaque], difficulty: Difficulty.hard),
  CardName(name: "Fusion de groupe",type: [BingoType.kta, BingoType.plaque],icon: "0xe068",description: "Deux groupes qui squattent / bougent ensemble", difficulty: Difficulty.easy),
  CardName(name: "Tous dans la même tenue",type: [BingoType.kta, BingoType.plaque],icon: "0xf508", description: "Personnes habilé de la même façon ou dans un même thème", difficulty: Difficulty.hard),
  CardName(name: "Repas",type: [BingoType.kta],icon: "0xf2e7", description: "Repas partagé consistant et/ou cuisine élaborée, différent sandwich, houmous, etc", difficulty: Difficulty.medium, excludes: ["Apéro"]),
  CardName(name: "Apéro", type: [BingoType.kta], icon: "0xe4c6", description: "Une bière et des trucs à partager", difficulty: Difficulty.easy, excludes: ["Repas"]),
  CardName(name: "Fumi",type: [BingoType.kta],icon: "0xf75f", description: "Tu vois pas devant toi", difficulty: Difficulty.medium),
  CardName(name: "Perdu",type: [BingoType.kta],icon: "0xe551", description: "Personne ne sachant pas où elle se trouve", difficulty: Difficulty.medium),
  CardName(name: "Chantier", type: [BingoType.kta], icon: "0xf85e", difficulty: Difficulty.medium),
  CardName(name: "Traquenard",type: [BingoType.kta],icon: "0xe535",description: "Changement / nouveau plan qui fait remonter plus tard", difficulty: Difficulty.easy),
  CardName(name: "Hamac", type: [BingoType.kta], description: "Présence d'un hamac installé quelqu'il soit", difficulty: Difficulty.easy),
  CardName(name: "Plan papier", type: [BingoType.kta], icon: "0xf279", description: "Objet tangible qui représente le réseau", difficulty: Difficulty.hard),
  CardName(name: "Hardtech de mauvais goût", type: [BingoType.kta], icon: "0xf001", description: "Musique électronique trop fort", difficulty: Difficulty.easy, excludes: ["Enceinte à fond"])
];
