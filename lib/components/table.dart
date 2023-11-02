// import 'dart:ui';

// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flutter/material.dart' hide Card;
// import 'package:sipa/sipa_game.dart';

// import '../pile.dart';
// import 'card.dart';

// class GameTable extends PositionComponent with TapCallbacks implements Pile {
//   GameTable({super.position}) : super(size: SipaGame.gameTableSize);

//   /// Which cards are currently placed onto this pile. The first card in the
//   /// list is at the bottom, the last card is on top.
//   final List<Card> _cards = [];

//   //#region Pile API

//   @override
//   bool canMoveCard(Card card) => false;

//   @override
//   bool canAcceptCard(Card card) => true;

//   @override
//   void removeCard(Card card) => throw StateError('cannot remove cards');

//   @override
//   void returnCard(Card card) => throw StateError('cannot remove cards');

//   @override
//   void acquireCard(Card card) {
//     double totalCardsWidth = _cards.length * SipaGame.cardGap;
//     // assert(card.isFaceDown);
//     card.pile = this;
//     // card.position = position;
//     double currentX = totalCardsWidth + (_cards.length * SipaGame.cardWidth);
//     card.position = Vector2(currentX, size.y / 2);
//     card.priority = _cards.length;
//     _cards.add(card);
//   }

//   //#endregion

//   @override
//   void onTapUp(TapUpEvent event) {}

//   //#region Rendering

//   final _borderPaint = Paint()
//     ..style = PaintingStyle.stroke
//     ..strokeWidth = 10
//     ..color = const Color(0xFF3F5B5D);
//   final _circlePaint = Paint()
//     ..style = PaintingStyle.stroke
//     ..strokeWidth = 100
//     ..color = const Color(0x883F5B5D);

//   @override
//   void render(Canvas canvas) {
//     Sprite table = tableSprite();
//     table.render(
//       canvas,
//       position: Vector2(size.x / 2, size.y / 2),
//       anchor: Anchor.center,
//       // size: table.srcSize.scaled(4.5),
//     );

//     // for (var element in _cards) {
//     //   element.render(canvas);
//     // }
//   }

//   //#endregion
// }
