import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../bloc/battles/bloc.dart' hide Loaded;
import '../bloc/currentplayertag/bloc.dart';
import '../bloc/player/bloc.dart' hide Loaded;
import '../bloc/upcomingchest/bloc.dart' hide Loaded;
import '../widgets/battles_view.dart';
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
    return BlocListener<CurrentPlayerTagBloc, CurrentPlayerTagState>(
      listener: (BuildContext context, state) {
        if (state is Loaded) {
          var playerTag = state.playerTag.playerTag;

          context.read<PlayerBloc>().add(GetPlayerEvent(playerTag));
          context
              .read<UpcomingChestsBloc>()
              .add(GetUpcomingChestsEvent(playerTag));
          context.read<BattlesBloc>().add(GetBattlesEvent(playerTag));
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TabBar(
            controller: _nestedTabController,
            indicatorColor: AppColors.player.tabBarIndicatorColor,
            labelColor: AppColors.player.tabBarLabelColor,
            unselectedLabelColor: AppColors.player.tabBarUnselectedLabelColor,
            isScrollable: true,
            tabs: _playerTabBarList(),
          ),
          Expanded(
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
        text: AppTexts.ui.player,
      ),
      Tab(
        text: AppTexts.ui.upcoming,
      ),
      Tab(
        text: AppTexts.ui.cards,
      ),
      Tab(
        text: AppTexts.ui.battles,
      ),
      Tab(
        text: AppTexts.ui.achieved,
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
        child: BattlesView(),
      ),
      Container(
        child: AchievementsView(),
      ),
    ];
  }

  @override
  void initState() {
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
