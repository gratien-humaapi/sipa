import 'package:sipa/logic/get_card.dart';
import 'package:sipa/models/player.dart';
import 'package:sipa/rank.dart';

void giveCards(List<Player> players) {
// Creation des cartes
  final cards = [
    for (var rank = 7; rank <= 13; rank++)
      for (var suit in ['s', 'h', 'c', 'd']) Rank.fromValueAndLabel(rank, suit),
  ];
// Melange des cartes
  cards.shuffle();

// Distribution des cartes
  for (var player in players) {
    for (var i = 0; i < 5; i++) {
      player.acquireCard(cards.removeLast());
    }
  }

// Ajout des cartes restants au stock
  // print(cards.length);
  // cards.forEach(stock.acquireCard)
}
