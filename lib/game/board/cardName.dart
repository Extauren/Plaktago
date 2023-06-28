enum plaqueTypeList { triangle, ronde, tortue, soleil, carrer, all }

class CardName {
  String name;
  plaqueTypeList plaqueType;
  int difficulty;

  CardName(this.name, this.plaqueType, this.difficulty);
}

List<CardName> cardNameListPlaque = [
  CardName("Bus (sup à 6 pers)", plaqueTypeList.all, 3),
  CardName("Kta star", plaqueTypeList.all, 3),
  CardName("Copain", plaqueTypeList.all, 1),
  CardName("Lampe allumée", plaqueTypeList.all, 1),
  CardName("Touristes (> 50 % du groupe / +2 ristou que de ktaphile)",
      plaqueTypeList.all, 1),
  CardName("Regarde mais s'arrête pas", plaqueTypeList.all, 1),
  CardName("Police", plaqueTypeList.all, 3),
  CardName("Fermeture de plaque asardeuse", plaqueTypeList.all, 1),
  CardName("Dégonde la plaque", plaqueTypeList.triangle, 2),
  CardName("Claque le plaque", plaqueTypeList.all, 1),
  CardName("Solitaire", plaqueTypeList.all, 1),
  CardName("Arrive pas à ouvrir", plaqueTypeList.all, 2),
  CardName("Galère à cause du sac", plaqueTypeList.all, 1),
  CardName("Reste à côter de la plaque", plaqueTypeList.all, 1),
  CardName("Fil d'attente", plaqueTypeList.all, 1),
  CardName("Tir sur la mauvaise plaque", plaqueTypeList.all, 1),
  CardName("Random qui s'arrête regarder", plaqueTypeList.all, 1),
  CardName("Fifi tier", plaqueTypeList.all, 3),
  CardName("Tir plaque original", plaqueTypeList.all, 1),
  CardName("Couple / Duo", plaqueTypeList.all, 1),
  CardName("Attent un pote", plaqueTypeList.all, 1),
  CardName("Laisse la palque ouverte", plaqueTypeList.all, 3),
  CardName("Fifi tier", plaqueTypeList.all, 1),
  CardName("Plaque ouverte +1min / pers", plaqueTypeList.all, 1),
  CardName("Trop propre", plaqueTypeList.all, 1),
  CardName("Discute à coté (d'autre joueur)", plaqueTypeList.all, 1),
  CardName("Discute palque ouverte", plaqueTypeList.all, 1),
  CardName("Trop propre", plaqueTypeList.all, 1),
  CardName("Fusion de groupe", plaqueTypeList.all, 2),
  CardName("Tous dans le même tenue", plaqueTypeList.all, 2),
];
