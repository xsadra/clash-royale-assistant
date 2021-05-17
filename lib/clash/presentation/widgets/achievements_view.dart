import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/bloc/player/bloc.dart';
import 'widgets.dart';

class AchievementsView extends StatelessWidget {
  const AchievementsView({Key key}) : super(key: key);

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
              return _loadedDisplay(state);
            }
            return MessageDisplay(message: 'Unhandled State');
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
          MessageDisplay(message: 'No data'),
        ],
      ),
    );
  }

  Widget _loadedDisplay(Loaded state) {
    return SingleChildScrollView(
      child: AchievementsDetails(state: state),
    );
  }
}
