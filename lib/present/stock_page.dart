import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_sample_2/data/data_model/stock.dart';
import 'package:redux_sample_2/data/state/stock_state.dart';
import 'package:redux_sample_2/logic/stock_action.dart';

class StockPage extends StatelessWidget {
  StockPage({Key? key}) : super(key: key);

  final TextEditingController textControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  controller: textControl,
                  placeholder: "Input stock no. (ex. 2330)",
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: const Icon(Icons.search),
                onTap: () {
                  StoreProvider.of<StockState>(context)
                      .dispatch(StockQueryAction(stockNo: textControl.text).getStock);
                },
              ),
            ],
          ),
          Flexible(
            child: StoreConnector<StockState, Stock>(
              converter: (store) => store.state.stock,
              builder: (context, stock) {
                return ListView.separated(
                  itemCount: 7,
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.grey.shade200,
                  ),
                  itemBuilder: (context, index) {
                    String? title;
                    String? value;
                    Color valueColor = Colors.grey.shade900;
                    switch (index) {
                      case 0:
                        return Container(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                          child: Text(
                            stock.name.isNotEmpty ? stock.name : "No Input",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      case 1:
                        title = "Start Price: ";
                        value = stock.start;
                        break;
                      case 2:
                        title = "End Price: ";
                        value = stock.end;
                        break;
                      case 3:
                        title = "Highest Price: ";
                        value = stock.high;
                        break;
                      case 4:
                        title = "Lowest Price: ";
                        value = stock.low;
                        break;
                      case 5:
                        title = "Dealing Amount: ";
                        value = stock.amount;
                        break;
                      case 6:
                        title = "Price change: ";
                        value = stock.difference;
                        valueColor = double.parse(stock.difference) >= 0
                            ? Colors.red.shade600
                            : Colors.green.shade600;
                        break;
                      default:
                        break;
                    }
                    if (title != null && value != null) {
                      return Row(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            value,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: valueColor,
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
