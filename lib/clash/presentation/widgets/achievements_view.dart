import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../../presentation/bloc/player/bloc.dart';
import '../bloc/network_connection_checker/bloc.dart' hide Empty, Error;
import 'widgets.dart';

class AchievementsView extends StatelessWidget {
  const AchievementsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NetworkConnectionCheckerBloc>().add(ConnectionCheckerEvent());
    return Center(
      child: Padding(
        padding: AppStyles.padding.all8,
        child: BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            if (state is Empty) {
              return EmptyDisplay();
            } else if (state is Error) {
              return MessageDisplay(message: state.message);
            } else if (state is Loading) {
              return LoadingWidget();
            } else if (state is Loaded) {
              return SingleChildScrollView(
                child: AchievementsDetails(state: state),
              );
            }
            return MessageDisplay(message: AppTexts.uiMessages.unhandledState);
          },
        ),
      ),
    );
  }
}
