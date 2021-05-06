import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/texts.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/upcoming_chest.dart';
import '../bloc/upcomingchest/bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
        actions: [],
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<UpcomingChestsBloc, UpcomingChestsState>(
          builder: (context, state) {
            if (state is Empty) {
              return MessageDisplay(message: 'No data');
            } else if (state is Error) {
              return MessageDisplay(message: state.message);
            } else if (state is Loading) {
              return LoadingWidget();
            } else if (state is Loaded) {
              return UpcomingChestsDisplay(state: state);
            }
            return MessageDisplay(message: 'Unhandled State');
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context
        .read<UpcomingChestsBloc>()
        .add(GetUpcomingChestsEvent('%23PPGRVJJQ'));
  }
}

class UpcomingChestsDisplay extends StatelessWidget {
  final Loaded state;

  UpcomingChestsDisplay({
    this.state,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.upcomingChests.length,
      itemBuilder: (context, index) {
        UpcomingChest chest = state.upcomingChests.elementAt(index);
        return ListTile(
          title: Text(chest.name),
          trailing: Text((chest.index + 1).toString()),
          leading: Image.asset(chestNameToPath(chest.name)),
        );
      },
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({
    Key key,
    @required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: TextStyle(fontSize: 25.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
