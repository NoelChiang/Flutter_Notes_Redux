import 'package:redux_sample_2/data/data_model/stock.dart';

class StockState {
  final Stock stock;
  StockState({
    required this.stock,
  });

  StockState.initial() : stock = Stock.empty();

  StockState copyWith({
    Stock? stock,
  }) {
    return StockState(
      stock: stock ?? this.stock,
    );
  }
}
