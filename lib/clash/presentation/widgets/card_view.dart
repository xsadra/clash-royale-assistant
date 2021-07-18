import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../../presentation/bloc/player/bloc.dart';
import '../bloc/network_connection_checker/bloc.dart' hide Empty, Error;
import 'widgets.dart';

class CardsView extends StatelessWidget {
  const CardsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('build', name: 'CardsView');
    context.read<NetworkConnectionCheckerBloc>().add(ConnectionCheckerEvent());
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

  Widget _loadedDisplay(Loaded state) {
    return SingleChildScrollView(
      child: CardsDetails(state: state),
    );
  }
}
