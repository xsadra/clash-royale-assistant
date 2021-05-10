import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/texts.dart';
import '../bloc/upcomingchest/bloc.dart';
import '../widgets/widgets.dart';

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
      bottomNavigationBar: ConvexAppBar.badge(
        {},
        items: [
          TabItem(
            icon: Icons.person,
            title: 'Profile',
          ),
          TabItem(icon: Icons.search, title: 'Search'),
        ],
        badgeMargin: EdgeInsets.only(bottom: 36, left: 30),
        height: 56.0,
        curveSize: 94.0,
        style: TabStyle.reactCircle,
        backgroundColor: Color(0xFF190F2A),
        // top: -24,
        initialActiveIndex: 0,
        //optional, default as 0
        onTap: (int i) => print('click index=$i'),
      ),
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
              return UpcomingChestsGridView(state: state);
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
