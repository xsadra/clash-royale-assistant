import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../bloc/network_connection_checker/bloc.dart' hide Empty, Error;
import '../bloc/player/bloc.dart';
import '../bloc/version_checker/bloc.dart' hide Empty, Error, Loading, Loaded;
import 'widgets.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NetworkConnectionCheckerBloc>().add(ConnectionCheckerEvent());
    context.read<VersionCheckerBloc>().add(CheckIsUpdatedVersionEvent());
    context.read<VersionCheckerBloc>().add(ReadVersionEvent());

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PlayerBloc, PlayerState>(
          buildWhen: (previous, current) => current != previous,
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
