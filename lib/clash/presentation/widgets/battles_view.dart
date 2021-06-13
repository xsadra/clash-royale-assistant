import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../bloc/battles/bloc.dart';
import 'battles_details.dart';
import 'widgets.dart';

class BattlesView extends StatelessWidget {
  const BattlesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<BattlesBloc, BattlesState>(
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
            return MessageDisplay(message: AppUIMessagesText.UNHANDLED_STATE);
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
    return BattlesDetails(state: state);
  }
}
