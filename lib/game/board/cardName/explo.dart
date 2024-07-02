import 'package:plaktago/game/board/cardName/card_name.dart';
import 'package:plaktago/home/bingo_type_button.dart';

List<CardName> exploCard = [
  CardName(name: "Visiter 5 salles",type: [BingoType.exploration],icon: "0x35", difficulty: Difficulty.easy),
  CardName(name: "Prendre 5 chatière",type: [BingoType.exploration],icon: '0x35', difficulty: Difficulty.easy),
  CardName(name: "Galerie atypique", type: [BingoType.exploration], icon: "0xf6d9", difficulty: Difficulty.easy),
  CardName(name: 'Jamais vu',type: [BingoType.exploration],icon: "0xf06e", description: "Découverte d'un nouvel endroit dans le réseau", difficulty: Difficulty.medium),
  CardName(name: 'Belle épure', type: [BingoType.exploration], icon: "0xf396", difficulty: Difficulty.medium),
  CardName(name: "Basse", type: [BingoType.exploration], icon: "0xf683", description: "Galerie basse", difficulty: Difficulty.easy),
  CardName(name: "Injection", type: [BingoType.exploration], description: "Galerie injectée", difficulty: Difficulty.medium),
  CardName(name: "Fontis", type: [BingoType.exploration], icon: "0xe508", description: "Fontis", difficulty: Difficulty.medium),
  CardName(name: "Concrétion", type: [BingoType.exploration], icon: "0xf7ad", description: "Belle concrétion", difficulty: Difficulty.hard),
  CardName(name: "Forêt de pillier à bras", type: [BingoType.exploration], difficulty: Difficulty.hard),
  CardName(name: "Besoin d'outils", type: [BingoType.exploration], icon: "0xf7d9", description: "Besoin d'outils pour accéder à un endroit", difficulty: Difficulty.hard),
  CardName(name: "Chatière d'accès", type: [BingoType.exploration], icon: "0xe599", description: "Besoin d'emprunter une chatière pour y accéder", difficulty: Difficulty.easy),
  CardName(name: "Tag d'avant 2000", type: [BingoType.exploration], icon: "0xf55d", difficulty: Difficulty.hard),
  CardName(name: "Mouillé", type: [BingoType.exploration], icon: "0xf773", description: "Zone innondé / besoin de cuissarde / Bottes remplis", difficulty: Difficulty.medium),
  CardName(name: "Vieux object", type: [BingoType.exploration], description: "Objet rouillé / ancien voire très ancien", difficulty: Difficulty.hard),
  CardName(name: "Escalade", type: [BingoType.exploration], description: "Besoin d'escalader pour y accéder", difficulty: Difficulty.hard),
  CardName(name: "Bassin d'eau", type: [BingoType.exploration], difficulty: Difficulty.medium),
  CardName(name: "Trace humaine", type: [BingoType.exploration], icon: "0xf577", description: "Preuve d'un passage récent d'être humains", difficulty: Difficulty.medium),
  CardName(name: "Clef", type: [BingoType.exploration], icon: "0xf084", description: "Besoin de clef pour accéder à un endroit", difficulty: Difficulty.hard),
  CardName(name: "Belle hauteur", type: [BingoType.exploration], difficulty: Difficulty.medium),
  CardName(name: "Plaque relou", type: [BingoType.exploration], difficulty: Difficulty.hard)
];