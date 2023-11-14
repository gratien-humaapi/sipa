import 'package:flutter/material.dart';
import 'package:sipa/models/player.dart';

import 'package:flutter/material.dart';

import '../rank.dart';

class ComputerCard {
  final Rank rank;
  final AnimationController animationController;

  ComputerCard({
    required this.rank,
    required TickerProvider vsync,
    Duration duration = const Duration(milliseconds: 200),
  }) : animationController = AnimationController(
          vsync: vsync,
          duration: duration,
        );
}

class Computer {
  final String name;
  final String id;
  final List<ComputerCard> _computerCards = [];

  Computer({required this.name, required this.id});

  List<ComputerCard> get cards => _computerCards;

  void acquireComputerCard(ComputerCard card) {
    _computerCards.add(card);
  }

  void removeComputerCard(Rank cardToRemove) {
    _computerCards.removeWhere((cCard) =>
        cCard.rank.label == cardToRemove.label &&
        cCard.rank.value == cardToRemove.value);
  }
}
