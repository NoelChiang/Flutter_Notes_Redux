import 'package:redux_sample_2/data/data_model/stock.dart';
import 'package:redux_sample_2/data/state/stock_state.dart';
import 'package:redux_sample_2/logic/stock_action.dart';

StockState stockReducer(StockState state, dynamic action) {
  if (action is StockRefreshAction) {
    return StockState(stock: action.stock);
  }
  if (action is StockQueryFailedAction) {
    Stock stock = Stock.empty();
    stock.defalutName = "API request failed with status: ${action.status}";
    return StockState(stock: stock);
  }
  return state;
}
