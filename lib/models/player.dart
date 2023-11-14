import 'package:flutter/widgets.dart';
import 'package:sipa/components/card.dart';
import 'package:sipa/logic/get_card.dart';
import 'package:sipa/rank.dart';

class Player {
  final String name;
  final String id;
  final List<Rank> _cards = [];

  List<Rank> get cards => _cards;

  Player({required this.name, required this.id});

  void removeCard(Rank cardToRemove) {
    // assert(_cards.contains(card));

    _cards.removeWhere((card) =>
        card.label == cardToRemove.label && card.value == cardToRemove.value);
  }

  void acquireCard(Rank card) {
    _cards.add(card);
  }
}
