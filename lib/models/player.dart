import 'package:flutter/widgets.dart';
import 'package:sipa/components/card.dart';
import 'package:sipa/logic/get_card.dart';
import 'package:sipa/rank.dart';

import '../pile.dart';

class Player implements Pile {
  final String name;
  final String id;
  final List<Carte> _cards = [];

  List<Carte> get cards => _cards;

  Player({required this.name, required this.id});

  @override
  bool canMoveCard(Carte card) => card.isFaceUp;

  @override
  bool canAcceptCard(Carte card) {
    // if (_cards.isEmpty) {
    //   return card.rank.value == 13;
    // } else {
    //   final topCard = _cards.last;
    //   return card.suit.isRed == !topCard.suit.isRed &&
    //       card.rank.value == topCard.rank.value - 1;
    // }
    return true;
  }

  @override
  void removeCard(Rank cardToRemove) {
    // assert(_cards.contains(card));

    final int index = _cards.indexWhere((card) =>
        card.rank.label == cardToRemove.label &&
        card.rank.value == cardToRemove.value);
    cards.insert(index, Carte.empty());
  }

  @override
  List<Widget> returnCard() {
    return _cards.map((e) => e.rank.sprite).toList();
  }

  @override
  void acquireCard(Carte card) {
    card.pile = this;
    _cards.add(card);
  }
}
