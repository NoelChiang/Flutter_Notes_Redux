import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sample_2/data/state/block_state.dart';
import 'package:redux_sample_2/logic/block_action.dart';
import 'package:redux_sample_2/logic/block_view_model.dart';

class BlockPage extends StatelessWidget {
  const BlockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Center(
            child: StoreConnector<BlockState, BlockViewModel>(
              converter: (store) => BlockViewModel(
                  color: store.state.color,
                  cornerRadius: store.state.cornerRadius,
                  blockWidth: 250,
                  blockHeight: 200),
              builder: (context, viewModel) {
                return Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    color: viewModel.color,
                    borderRadius: BorderRadius.circular(viewModel.corner),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "COLOR",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Row(
            children: [
              const Text("Red: "),
              StoreConnector<BlockState, double>(
                  builder: (context, red) {
                    return Text(
                      red.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                  converter: (store) => store.state.red),
            ],
          ),
          Center(
            child: SizedBox(
              child: StoreConnector<BlockState, double>(
                converter: (store) => store.state.red,
                builder: (context, red) {
                  return CupertinoSlider(
                    value: red,
                    max: 255,
                    min: 0,
                    onChanged: (newValue) {
                      StoreProvider.of<BlockState>(context)
                          .dispatch(BlockChangeColorCodeAction(red: newValue));
                    },
                  );
                },
              ),
              width: 300,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text("Green: "),
              StoreConnector<BlockState, double>(
                converter: (store) => store.state.green,
                builder: (context, green) {
                  return Text(
                    green.toInt().toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              )
            ],
          ),
          Center(
            child: SizedBox(
              child: StoreConnector<BlockState, double>(
                converter: (store) => store.state.green,
                builder: (context, green) {
                  return CupertinoSlider(
                    value: green,
                    max: 255,
                    min: 0,
                    onChanged: (newValue) {
                      StoreProvider.of<BlockState>(context)
                          .dispatch(BlockChangeColorCodeAction(green: newValue));
                    },
                  );
                },
              ),
              width: 300,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Text("Blue: "),
              StoreConnector<BlockState, double>(
                  builder: (context, blue) {
                    return Text(
                      blue.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                  converter: (store) => store.state.blue),
            ],
          ),
          Center(
            child: SizedBox(
              child: StoreConnector<BlockState, double>(
                  converter: (store) => store.state.blue,
                  builder: (context, blue) {
                    return CupertinoSlider(
                      value: blue,
                      max: 255,
                      min: 0,
                      onChanged: (newValue) {
                        StoreProvider.of<BlockState>(context)
                            .dispatch(BlockChangeColorCodeAction(blue: newValue));
                      },
                    );
                  }),
              width: 300,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "ROUNDED CORNER",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              child: StoreConnector<BlockState, double>(
                  converter: (store) => store.state.cornerRadius,
                  builder: (context, radius) {
                    return CupertinoSlider(
                      value: radius,
                      max: 1,
                      min: 0,
                      onChanged: (newValue) {
                        StoreProvider.of<BlockState>(context)
                            .dispatch(BlockChangeCornerAction(radius: newValue));
                      },
                    );
                  }),
              width: 300,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
