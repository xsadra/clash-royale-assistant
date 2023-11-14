import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../bloc/network_connection_checker/bloc.dart' hide Empty, Error;
import '../bloc/upcomingchest/bloc.dart';
import 'widgets.dart';

class UpcomingChestsView extends StatelessWidget {
  const UpcomingChestsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NetworkConnectionCheckerBloc>().add(ConnectionCheckerEvent());
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<UpcomingChestsBloc, UpcomingChestsState>(
          builder: (context, state) {
            return _stateToWidget(state);
          },
        ),
      ),
    );
  }

  StatelessWidget _stateToWidget(UpcomingChestsState state) {
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
  }

  SingleChildScrollView _emptyDisplay() {
    return SingleChildScrollView(
      child: Column(
        children: [
          InputTag(),
          MessageDisplay(message: AppTexts.uiMessages.noData),
        ],
      ),
    );
  }

  SingleChildScrollView _loadedDisplay(Loaded state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UpcomingChestsGridView(state: state),
          Container(
            height: 250,
          ),
        ],
      ),
    );
  }
}
