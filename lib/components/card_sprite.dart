import 'package:flutter/material.dart';

Widget cardSprite(String path) {
  return Image.asset(
    path,
    width: 55,
    height: 75,
    fit: BoxFit.contain,
  );
}
