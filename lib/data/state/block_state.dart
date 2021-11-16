import 'package:flutter/material.dart';

class BlockState {
  final double red;
  final double green;
  final double blue;
  final double alpha;
  final double cornerRadius;
  BlockState({
    required this.red,
    required this.green,
    required this.blue,
    required this.alpha,
    required this.cornerRadius,
  });

  BlockState.initial()
      : red = 0,
        green = 0,
        blue = 0,
        alpha = 1,
        cornerRadius = 0;

  BlockState copyWith({
    double? red,
    double? green,
    double? blue,
    double? alpha,
    double? cornerRadius,
  }) {
    return BlockState(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      alpha: alpha ?? this.alpha,
      cornerRadius: cornerRadius ?? this.cornerRadius,
    );
  }

  Color get color => Color.fromRGBO(
        red.toInt(),
        green.toInt(),
        blue.toInt(),
        alpha,
      );
}
