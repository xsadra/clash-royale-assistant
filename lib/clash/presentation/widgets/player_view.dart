import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../bloc/player/bloc.dart';
import 'widgets.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            if (state is Empty) {
              return _emptyDisplay();
            } else if (state is Error) {
              return MessageDisplay(message: state.message);
            } else if (state is Loading) {
              return LoadingWidget();
            } else if (state is Loaded) {
              return PlayerDetails(state: state);
            }
            return MessageDisplay(message: AppTexts.uiMessages.unhandledState);
          },
        ),
      ),
    );
  }

  Widget _emptyDisplay() {
    return SingleChildScrollView(
      child: Column(
        children: [
          RefreshPlayer(),
          MessageDisplay(message: AppTexts.uiMessages.noData),
        ],
      ),
    );
  }
}
