import 'dart:developer';

import 'package:clash_royale_assistant/core/platform/assets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/consts.dart';
import '../../../injection_container.dart' as injection;
import '../../presentation/bloc/player/bloc.dart';
import '../../presentation/bloc/upcomingchest/bloc.dart';
import '../bloc/battles/bloc.dart';
import '../bloc/currentplayertag/bloc.dart';
import 'bottom_navigation_bar.dart';
import 'player_nested_tab_page.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var playerProviders = [
      BlocProvider(create: (context) => injection.sl<PlayerBloc>()),
      BlocProvider(create: (context) => injection.sl<CurrentPlayerTagBloc>()),
      BlocProvider(create: (context) => injection.sl<UpcomingChestsBloc>()),
      BlocProvider(create: (context) => injection.sl<BattlesBloc>())
    ];
    log('build', name: 'PlayerPage');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppTexts.body.appTitle),
          actions: [
            TextButton(
              onPressed: () {
                buildShowAboutDialog(context);
              },
              child: Icon(Icons.info_outline),
            )
          ],
        ),
        body: MultiBlocProvider(
          providers: playerProviders,
          child: PlayerNestedTabPage(),
        ),
        bottomNavigationBar: BottomNavBar(
          initialActiveIndex: 0,
        ),
      ),
    );
  }

  void buildShowAboutDialog(BuildContext context) {
    return showAboutDialog(
      context: context,
      applicationVersion: '1.0.1',
      applicationName: 'Cr-App',
      applicationIcon: Image.asset(
        AppAssets.icons.appIconRound,
        width: 96,
        height: 96,
      ),
      applicationLegalese: 'Developer: Sadra Babai',
      children: [
        Text(
          'Clash Royale Assistant helps you have a better gaming experience. All information used in this app is taken from the clashroyale.com website.',
          style: TextStyle(fontFamily: AppAssets.fonts.rajdhani),
        ),
        Text(
          'Email us if you have any suggestions for improving the app, or if you encounter an error in the app. We read all your emails carefully and make changes.',
          style: TextStyle(
            fontFamily: AppAssets.fonts.rajdhani,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade900,
          ),
        ),
        InkWell(
          onTap: () => launch('mailto:cra@sadra.at?subject=From%20Cr-App'),
          child: Text(
            'cra@sadra.at',
            style: TextStyle(
              color: Colors.blue,
              fontStyle: FontStyle.italic,
              letterSpacing: 2,
            ),
          ),
        )
      ],
    );
  }
}
