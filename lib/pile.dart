import 'package:flutter/widgets.dart';
import 'package:sipa/logic/get_card.dart';
import 'package:sipa/rank.dart';

import 'components/card.dart';

abstract class Pile {
  /// Returns true if the [card] can be taken away from this pile and moved
  /// somewhere else.
  bool canMoveCard(Carte card);

  /// Returns true if the [card] can be placed on top of this pile. The [card]
  /// may have other cards "attached" to it.
  bool canAcceptCard(Carte card);

  /// Removes [card] from this pile; this method will only be called for a card
  /// that both belong to this pile, and for which [canMoveCard] returns true.
  void removeCard(Rank card);

  /// Places a single [card] on top of this pile. This method will only be
  /// called for a card for which [canAcceptCard] returns true.
  void acquireCard(Carte card);

  /// Returns all player cards
  List<Widget> returnCard();
}
