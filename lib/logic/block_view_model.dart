import 'dart:math';

import 'package:flutter/material.dart';

class BlockViewModel {
  final Color color;
  final double cornerRadius;
  final double blockWidth;
  final double blockHeight;
  BlockViewModel({
    required this.color,
    required this.cornerRadius,
    required this.blockWidth,
    required this.blockHeight,
  });

  double get corner => min(blockWidth, blockHeight) * 0.5 * cornerRadius;
}
