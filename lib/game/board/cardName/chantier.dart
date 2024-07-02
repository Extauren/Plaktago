import 'package:plaktago/game/board/cardName/card_name.dart';
import 'package:plaktago/home/bingo_type_button.dart';

List<CardName> chantierCard = [
  CardName(name: "Perfo", type: [BingoType.chantier], icon: "0xf54a", description: "Perfo burinateur présent sur le chantier", difficulty: Difficulty.medium),
  CardName(name: "Marteau / burin", type: [BingoType.chantier], icon: "0xf6e3", description: "Massette et burin (un marteau de géologue qui tape sur un pied-de-biche marche aussi)", difficulty: Difficulty.easy),
  CardName(name: "Ventilo", type: [BingoType.chantier], icon: "0xf863", description: "Ventilateur pour renouveler l'air", difficulty: Difficulty.hard),
  CardName(name: "Outils à roue", type: [BingoType.chantier], description: "Ex : brouette / bac à roulette brouette ou autre skate", difficulty: Difficulty.medium),
  CardName(name: "Outils oublié", type: [BingoType.chantier], icon: "0xf7d9", description: "Outils indispensables au chantier oublié", difficulty: Difficulty.easy),
  CardName(name: "Foret de plus de 80 cm", type: [BingoType.chantier], description: "Sors ton mètre et vérifie (l'embout sds ne compte pas)", difficulty: Difficulty.hard),
  CardName(name: "Outils cassé", type: [BingoType.chantier], description: "Outil cassé lors de son utilisation sur le chantier", difficulty: Difficulty.hard),
  CardName(name: "Planche IGC fausse", type: [BingoType.chantier], icon: "0xf279", description: "Découverte d'erreur sur les planches IGC (comme d'habitude !)", difficulty: Difficulty.easy),
  CardName(name: "Detour imprévu", type: [BingoType.chantier], icon: "0xe551", description: "Nécessite de faire un détour pour raison de sécurité / tranquillité", difficulty: Difficulty.easy),
  CardName(name: "Auto remblayage", type: [BingoType.chantier], icon: "0xf6fc", description: "Quelqu'un qui s'auto remblaye en creusant", difficulty: Difficulty.easy),
  CardName(name: "Béton", type: [BingoType.chantier], description: "Beton qui nécéssite un détour ou un perfo", difficulty: Difficulty.medium),
  CardName(name: "Indésirable", type: [BingoType.chantier], icon: "0xf506", description: "Personne non voulue sur le chantier ou visite inopportuns", difficulty: Difficulty.medium),
  CardName(name: "Squat précaire", type: [BingoType.chantier], description: "Squat nul utilisé pour les pauses", difficulty: Difficulty.easy),
  CardName(name: "Hagues DIY", type: [BingoType.chantier], icon: "0xf7ae", description: "Création de hagues pour ranger le remblai", difficulty: Difficulty.easy),
  CardName(name: "Pause trop longue", type: [BingoType.chantier], icon: "0xf017", description: "Pause supérieure à 20 min", difficulty: Difficulty.easy),
  CardName(name: "Découverte remblayé", type: [BingoType.chantier], description: "Objet caché par le remblai", difficulty: Difficulty.medium),
  CardName(name: "Manque d'oxygène", type: [BingoType.chantier], icon: "0xe524", description: "Mal de tête causé par le manque d'oxygène", difficulty: Difficulty.hard),
  CardName(name: "Chatière galerie", type: [BingoType.chantier], icon: "0xf018",description: "Chatière avec beaucoup d'espace", difficulty: Difficulty.easy),
  CardName(name: "Chatière ver de terre", type: [BingoType.chantier], icon: "0xe599", description: "Chatière allongé uniquement", difficulty: Difficulty.easy),
  CardName(name: "Chaleur insoutenable", type: [BingoType.chantier], icon: "0xf2c7", description: "Il faut chaud sa mère", difficulty: Difficulty.easy),
  CardName(name: "Toujours au fond", type: [BingoType.chantier], description: "Personne ne voulant jamais faire les tâches ingrates", difficulty: Difficulty.medium),
  CardName(name: "Effondrement", type: [BingoType.chantier], icon:" 0xe508", description: "Ciel / hague qui est tombé", difficulty: Difficulty.medium),
  CardName(name: "Fissure au ciel", type: [BingoType.chantier], icon: "0xe3b1", description: "Fissure au ciel qui n'était pas là avant", difficulty: Difficulty.easy),
  CardName(name: "Esclavagisme", type: [BingoType.chantier], icon: "0xf0c1", description: "Personne qui travail contre sa volonté", difficulty: Difficulty.easy),
  CardName(name: "Electricité", type: [BingoType.chantier], description: "Chantier avec ou qui nécessite de l'électricité", difficulty: Difficulty.hard),
  CardName(name: "Chatière d'accès relou", type: [BingoType.chantier], icon: "0xe54f", description: "Besoin d'emprunter une chatière reloue pour accéder au chantier", difficulty: Difficulty.medium),
  CardName(name: "Outil volé", type: [BingoType.chantier], description: "Outil ayant disparu du chantier", difficulty: Difficulty.hard)
];