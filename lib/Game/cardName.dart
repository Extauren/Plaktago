enum plaqueTypeList { triangle, ronde, tortue, soleil, carrer, all }

class CardName {
  String name;
  plaqueTypeList plaqueType;
  int difficulty;

  CardName(this.name, this.plaqueType, this.difficulty);
}

List<CardName> cardNameList = [
  CardName("Bus (sup à 6 pers)", plaqueTypeList.all, 1),
  CardName("Kta star", plaqueTypeList.all, 1),
  CardName("Copain", plaqueTypeList.all, 1),
  CardName("Lampe allumée", plaqueTypeList.all, 1),
  CardName("Touristes (> 50 % du groupe)", plaqueTypeList.all, 1),
  CardName("Passe devant la plaque", plaqueTypeList.all, 1),
  CardName("Police", plaqueTypeList.all, 1),
  CardName("Fermeture de plaque asardeuse", plaqueTypeList.all, 1),
  CardName("Dégonde la plaque", plaqueTypeList.triangle, 1),
  CardName("Plaque bruillante", plaqueTypeList.all, 1),
  CardName("Solitaire", plaqueTypeList.all, 1),
  CardName("Arrive pas à ouvrir", plaqueTypeList.all, 1),
  CardName("Galère à cause du sac", plaqueTypeList.all, 1),
  CardName("Reste à côter de la plaque", plaqueTypeList.all, 1),
  CardName("Fil d'attente", plaqueTypeList.all, 1),
  CardName("Tir sur la mauvaise plaque", plaqueTypeList.all, 1),
  CardName("Random qui s'arrête regarder", plaqueTypeList.all, 1),
  CardName("Fifi tier", plaqueTypeList.all, 1),
];
