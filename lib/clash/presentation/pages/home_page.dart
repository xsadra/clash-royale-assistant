import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/texts.dart';
import '../../../injection_container.dart' as injection;
import '../../presentation/bloc/player/bloc.dart';
import '../../presentation/bloc/upcomingchest/bloc.dart';
import '../bloc/currentplayertag/bloc.dart';
import 'bottom_navigation_bar.dart';
import 'player_nested_tab_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var playerProviders = [
      BlocProvider(create: (context) => injection.sl<PlayerBloc>()),
      BlocProvider(create: (context) => injection.sl<CurrentPlayerTagBloc>()),
      BlocProvider(create: (context) => injection.sl<UpcomingChestsBloc>())
    ];
    log('build', name: 'HomePage');
    return Scaffold(
      appBar: AppBar(
        title: Text(APP_TITLE),
      ),
      body: MultiBlocProvider(
        providers: playerProviders,
        child: PlayerNestedTabPage(),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
