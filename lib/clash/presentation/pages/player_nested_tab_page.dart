import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/bloc/player/bloc.dart';
import '../../presentation/bloc/upcomingchest/bloc.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
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
        Container(
          height: screenHeight * 0.72,
          child: TabBarView(
            controller: _nestedTabController,
            children: _playerTabBarViewList(),
          ),
        )
      ],
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
      Tab(
        text: "Set Player",
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
      Container(
        child: SetCurrentPlayerView(),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _nestedTabController = new TabController(length: 5, vsync: this);
    // context.read<PlayerBloc>().
    context.read<PlayerBloc>().add(GetPlayerEvent('%23PPGRVJJQ'));
    context
        .read<UpcomingChestsBloc>()
        .add(GetUpcomingChestsEvent('%23PPGRVJJQ'));
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }
}
