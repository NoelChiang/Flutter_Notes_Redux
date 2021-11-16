import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

import 'package:redux_sample_2/data/data_model/stock.dart';
import 'package:redux_sample_2/data/state/stock_state.dart';

class StockRefreshAction {
  final Stock stock;
  StockRefreshAction({
    required this.stock,
  });
}

class StockQueryFailedAction {
  final int status;
  StockQueryFailedAction({
    required this.status,
  });
}

class StockQueryAction {
  final String stockNo;
  StockQueryAction({
    required this.stockNo,
  });

  void getStock(Store<StockState> store) async {
    final response = await http.Client().get(Uri.parse(
        "https://www.twse.com.tw/exchangeReport/STOCK_DAY?response=json&date=20211101&stockNo=$stockNo"));
    if (response.statusCode == 200) {
      final Stock stock = Stock.fromJson(jsonDecode(response.body));
      store.dispatch(StockRefreshAction(stock: stock));
    } else {
      store.dispatch(StockQueryFailedAction(status: response.statusCode));
    }
    final Stock stock = await http.Client()
        .get(Uri.parse(
            "https://www.twse.com.tw/exchangeReport/STOCK_DAY?response=json&date=20211101&stockNo=$stockNo"))
        .then((value) => Stock.fromJson(jsonDecode(value.body)));

    store.dispatch(StockRefreshAction(stock: stock));
  }
}
