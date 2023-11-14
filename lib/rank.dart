import 'package:flutter/widgets.dart';
import 'package:sipa/cards.dart';

import 'components/card_sprite.dart';

@immutable
class Rank {
  factory Rank.fromValueAndLabel(int value, String label) {
    assert(
      value == 0 || value >= 7 && value <= 13,
      'value is outside of the bounds of what a rank can be',
    );
    assert(
      ['d', 'c', 'h', 's', ''].contains(label),
      'label must be s, h, c or d',
    );
    return _singletons.firstWhere(
        (element) => element.value == value && element.label == label);
  }

  factory Rank.empty() {
    return Rank._(0, '', '');
  }

  Rank._(
    this.value,
    this.label,
    this.path,
  ) : sprite = cardSprite(path);

  final int value;
  final String label;
  final String path;
  final Widget sprite;

  static final List<Rank> _singletons = [
    for (CardInfo carte in cartes) Rank._(carte.value, carte.label, carte.path),
  ];
}
