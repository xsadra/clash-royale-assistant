import 'dart:developer';

import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/currentplayertag/bloc.dart';
import '../bloc/player/bloc.dart' hide Loaded;
import '../bloc/upcomingchest/bloc.dart' hide Loaded;
import '../widgets/widgets.dart';

class PlayerNestedTabPage extends StatefulWidget {
  @override
  _PlayerNestedTabPageState createState() => _PlayerNestedTabPageState();
}

class _PlayerNestedTabPageState extends State<PlayerNestedTabPage>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  Widget build(BuildContext context) {
    log('build', name: 'PlayerNestedTabPage');

    double screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<CurrentPlayerTagBloc, CurrentPlayerTagState>(
      listener: (BuildContext context, state) {
        log('BlocListener', name: 'PlayerNestedTabPage BlocListener');
        log(state.runtimeType.toString(),
            name: 'PlayerNestedTabPage BlocListener');

        if (state is Loaded) {
          log('state is Loaded', name: 'PlayerNestedTabPage BlocListener');
          var playerTag = state.playerTag.playerTag;

          log('add GetPlayerEvent to PlayerBloc: ' + playerTag,
              name: 'PlayerNestedTabPage BlocListener');

          context.read<PlayerBloc>().add(GetPlayerEvent(playerTag));
          log('add GetUpcomingChestsEvent to UpcomingChestsBloc: ' + playerTag,
              name: 'PlayerNestedTabPage BlocListener');
          context
              .read<UpcomingChestsBloc>()
              .add(GetUpcomingChestsEvent(playerTag));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TabBar(
            controller: _nestedTabController,
            indicatorColor: Colors.teal,
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.black54,
            isScrollable: true,
            tabs: _playerTabBarList(),
          ),
          Expanded(
            //flex: 1,
            child: Container(
              height: screenHeight * 0.72,
              child: TabBarView(
                controller: _nestedTabController,
                children: _playerTabBarViewList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _playerTabBarList() {
    return <Widget>[
      Tab(
        text: "Player",
      ),
      Tab(
        text: "Upcoming",
      ),
      Tab(
        text: "Cards",
      ),
      Tab(
        text: "Achieved",
      ),
    ];
  }

  List<Widget> _playerTabBarViewList() {
    return <Widget>[
      Container(
        child: PlayerView(),
      ),
      Container(
        child: UpcomingChestsView(),
      ),
      Container(
        child: CardsView(),
      ),
      Container(
        child: AchievementsView(),
      ),
    ];
  }

  @override
  void initState() {
    log('initState', name: 'PlayerNestedTabPage');
    super.initState();
    _nestedTabController =
        new TabController(length: _playerTabBarList().length, vsync: this);
    context.read<CurrentPlayerTagBloc>().add(GetCurrentPlayerTagEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }
}
