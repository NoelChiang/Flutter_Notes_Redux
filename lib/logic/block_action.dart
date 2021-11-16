class BlockChangeColorCodeAction {
  final double? red;
  final double? green;
  final double? blue;
  final double? alpha;
  BlockChangeColorCodeAction({
    this.red,
    this.green,
    this.blue,
    this.alpha,
  });
}

class BlockChangeCornerAction {
  final double radius;
  BlockChangeCornerAction({
    required this.radius,
  });
}
