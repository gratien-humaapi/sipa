import 'dart:math';

class Card {
  String type;
  int value;

  Card(this.type, this.value);
}

class Player {
  List<Card> hand;

  Player() : hand = [];

  void receiveCard(Card card) {
    hand.add(card);
  }

  bool hasCardOfType(String type) {
    return hand.any((card) => card.type == type);
  }

  Card giveCard(String type, int value) {
    var matchingCards =
        hand.where((card) => card.type == type && card.value > value).toList();
    if (matchingCards.isNotEmpty) {
      var randomIndex = Random().nextInt(matchingCards.length);
      var cardToGive = matchingCards[randomIndex];
      hand.remove(cardToGive);
      return cardToGive;
    } else {
      var randomIndex = Random().nextInt(hand.length);
      var cardToGive = hand[randomIndex];
      hand.remove(cardToGive);
      return cardToGive;
    }
  }
}

class Game {
  Player player;
  Player ai;

  Game()
      : player = Player(),
        ai = Player();

  void start() {
    // Simulation du jeu
    player.receiveCard(Card('h', 8));
    ai.receiveCard(Card('s', 10));
    // Le joueur commence le jeu
    while (true) {
      // Tour du joueur
      var playerCard = player.giveCard('h', 8);
      print(
          'Le joueur a donné la carte: ${playerCard.type}${playerCard.value}');

      // Vérification si l'IA possède une carte du même type
      if (ai.hasCardOfType(playerCard.type)) {
        var aiCard = ai.giveCard(playerCard.type, playerCard.value);
        print('L\'IA a donné la carte: ${aiCard.type}${aiCard.value}');
      } else {
        var aiCard = ai.giveCard('', 0); // L'IA donne n'importe quelle carte
        print('L\'IA a donné la carte: ${aiCard.type}${aiCard.value}');
      }

      // Le tour suivant commence avec le joueur
    }
  }
}

void main() {
  var game = Game();
  game.start();
}
