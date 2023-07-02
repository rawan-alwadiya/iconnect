import 'package:awesome_card/awesome_card.dart';

class PaymentType {
  List<String> creditCardTypes = [
    'assets/images/master_card.png',
    'assets/images/visa.png',
    'assets/images/jcb.png',
    'assets/images/dinars_club.png',
    'assets/images/maestro.png',
    'assets/images/american_express.png'];

  CardType cardType = CardType.masterCard;

  CardType chooseCardType(int index) {
    if (index == 0) {
      cardType = CardType.masterCard;
    } else if (index == 1) {
      cardType = CardType.visa;
    } else if (index == 2) {
      cardType = CardType.jcb;
    } else if (index == 3) {
      cardType = CardType.dinersClub;
    } else if (index == 4) {
      cardType = CardType.maestro;
    } else if (index == 5) {
      cardType = CardType.americanExpress;
    }
    return cardType;
  }

}