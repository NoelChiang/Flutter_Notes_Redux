import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sample_2/data/data_model/stock.dart';
import 'package:redux_sample_2/data/state/block_state.dart';
import 'package:redux_sample_2/data/state/stock_state.dart';
import 'package:redux_sample_2/logic/block_reducer.dart' as blockRedux;
import 'package:redux_sample_2/logic/stock_reducer.dart' as stockRedux;
import 'package:redux_sample_2/present/block_page.dart';
import 'package:redux_sample_2/present/stock_page.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: "Block control",
      localizationsDelegates: const [
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.crop_square_rounded), label: "Block"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stock"),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return SafeArea(
                child: StoreProvider<BlockState>(
                  store: Store(
                    blockRedux.blockReducer,
                    initialState: BlockState.initial(),
                  ),
                  child: BlockPage(),
                ),
              );
            case 1:
              return SafeArea(
                child: StoreProvider<StockState>(
                  store: Store(
                    stockRedux.stockReducer,
                    initialState: StockState.initial(),
                    middleware: [thunkMiddleware],
                  ),
                  child: StockPage(),
                ),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
