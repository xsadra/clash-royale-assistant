import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart' as injection;
import '../../presentation/bloc/profile/bloc.dart';
import '../widgets/widgets.dart';

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
