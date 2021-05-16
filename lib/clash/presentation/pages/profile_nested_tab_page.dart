import 'package:clash_royale_assistant/clash/domain/entities/profile.dart';
import 'package:clash_royale_assistant/clash/presentation/bloc/profile/bloc.dart';
import 'package:clash_royale_assistant/clash/presentation/widgets/achievements_details_widget.dart';
import 'package:clash_royale_assistant/clash/presentation/widgets/profile_view.dart';
import 'package:clash_royale_assistant/clash/presentation/widgets/stat_header_widget.dart';
import 'package:clash_royale_assistant/clash/presentation/widgets/upcoming_chests_view.dart';
import 'package:clash_royale_assistant/clash/presentation/widgets/widgets.dart';
import 'package:collection/collection.dart' show groupBy;
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../injection_container.dart' as injection;

class ProfileNestedTabPage extends StatefulWidget {
  @override
  _ProfileNestedTabPageState createState() => _ProfileNestedTabPageState();
}

class _ProfileNestedTabPageState extends State<ProfileNestedTabPage>
    with TickerProviderStateMixin {
  TabController _nestedTabController;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: Colors.teal,
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              text: "Profile",
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
              text: "X Not",
            ),
          ],
        ),
        Container(
          height: screenHeight * 0.72,
          // margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: TabBarView(
            controller: _nestedTabController,
            children: <Widget>[
              Container(
                child: BlocProvider(
                  create: (context) => injection.sl<ProfileBloc>(),
                  child: ProfileView(),
                ),
              ),
              Container(
                child: UpcomingChestsView(),
              ),
              Container(
                child: BlocProvider(
                  create: (context) => injection.sl<ProfileBloc>(),
                  child: CardsView(),
                ),
              ),
              Container(
                child: BlocProvider(
                  create: (context) => injection.sl<ProfileBloc>(),
                  child: AchievementsView(),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _nestedTabController = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }
}

class AchievementsView extends StatelessWidget {
  const AchievementsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
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

  Widget _emptyDisplay() {
    return SingleChildScrollView(
      child: Column(
        children: [
          RefreshProfile(),
          MessageDisplay(message: 'No data'),
        ],
      ),
    );
  }

  Widget _loadedDisplay(Loaded state) {
    return SingleChildScrollView(
      child: AchievementsDetails(state: state),
    );
  }
}

class CardsView extends StatelessWidget {
  const CardsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
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

  Widget _emptyDisplay() {
    return SingleChildScrollView(
      child: Column(
        children: [
          RefreshProfile(),
          MessageDisplay(message: 'No data'),
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

class CardsDetails extends StatelessWidget {
  const CardsDetails({Key key, this.state}) : super(key: key);
  final Loaded state;

  @override
  Widget build(BuildContext context) {
    var cards = state.profile.cards;
    cards.sort((b, a) =>
        (a.level + 13 - a.maxLevel).compareTo(b.level + 13 - b.maxLevel));
    var newList = groupBy(
        cards, (card) => (card as Card).level + 13 - (card as Card).maxLevel);
    // newList.map((key, value) => null).

    int currentDeckColumnCount = 4;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisSize: MainAxisSize.min,
      children: [
        for (var cardLevels in newList.keys) ...[
          Row(
            children: [
              StatHeader(
                icon: Icons.label_rounded,
                title: 'Level ' + cardLevels.toString(),
              ),
              Text(
                ' (${newList[cardLevels].length})',
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          AnimationLimiter(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 8,
              shrinkWrap: true,
              crossAxisCount: currentDeckColumnCount,
              children: List.generate(
                newList[cardLevels].length,
                (int index) {
                  Card card = newList[cardLevels].elementAt(index);
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 575),
                    columnCount: currentDeckColumnCount,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: CardDeckItem(card: card),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
        SizedBox(height: 16),
      ],
    );
  }
}
