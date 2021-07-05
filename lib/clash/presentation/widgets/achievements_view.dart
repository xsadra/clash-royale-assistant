import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../../presentation/bloc/player/bloc.dart';
import 'widgets.dart';

class AchievementsView extends StatelessWidget {
  const AchievementsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyle.paddings.all8,
        child: BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            if (state is Empty) {
              return EmptyDisplay();
            } else if (state is Error) {
              return MessageDisplay(message: state.message);
            } else if (state is Loading) {
              return LoadingWidget();
            } else if (state is Loaded) {
              return _loadedDisplay(state);
            }
            return MessageDisplay(message: AppText.uiMessages.unhandledState);
          },
        ),
      ),
    );
  }

  Widget _loadedDisplay(Loaded state) {
    return SingleChildScrollView(
      child: AchievementsDetails(state: state),
    );
  }
}
