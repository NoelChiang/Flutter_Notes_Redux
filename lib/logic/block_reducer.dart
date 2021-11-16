import 'package:redux_sample_2/data/state/block_state.dart';
import 'package:redux_sample_2/logic/block_action.dart';

BlockState blockReducer(BlockState state, dynamic action) {
  if (action is BlockChangeCornerAction) {
    return BlockState(
      red: state.red,
      green: state.green,
      blue: state.blue,
      alpha: state.alpha,
      cornerRadius: action.radius,
    );
  }
  if (action is BlockChangeColorCodeAction) {
    return BlockState(
      red: action.red ?? state.red,
      green: action.green ?? state.green,
      blue: action.blue ?? state.blue,
      alpha: action.alpha ?? state.alpha,
      cornerRadius: state.cornerRadius,
    );
  }
  return state;
}
