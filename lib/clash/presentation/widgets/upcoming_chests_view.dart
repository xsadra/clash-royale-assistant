import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/upcomingchest/bloc.dart';
import 'input_tag.dart';
import 'widgets.dart';

class UpcomingChestsView extends StatelessWidget {
  const UpcomingChestsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<UpcomingChestsBloc, UpcomingChestsState>(
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

  SingleChildScrollView _emptyDisplay() {
    return SingleChildScrollView(
      child: Column(
        children: [
          InputTag(),
          MessageDisplay(message: 'No data'),
        ],
      ),
    );
  }

  SingleChildScrollView _loadedDisplay(Loaded state) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InputTag(),
          UpcomingChestsGridView(state: state),
        ],
      ),
    );
  }
}
