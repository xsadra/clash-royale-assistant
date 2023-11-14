import 'package:clash_royale_assistant/clash/domain/entities/current_player_tag.dart';
import 'package:clash_royale_assistant/clash/presentation/bloc/player/bloc.dart';
import 'package:clash_royale_assistant/core/logs/logger.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'clash/presentation/bloc/currentplayertag/bloc.dart' as current;
// import 'clash/presentation/bloc/network_connection_checker/bloc.dart' as net;

import 'clash/presentation/bloc/version_checker/bloc.dart'as version;
import 'core/constants/consts.dart';
import 'injection_container.dart' as injection;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  SystemChrome.setSystemUIOverlayStyle(_systemUiOverlayStyle());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context.read<ValidateTagBloc>().add(
    //     CheckValidateTagEvent(tag:  'PPGRVJJQ', type: RoyaleTagsType.player));
    var _providers = [
      BlocProvider(
        create: (context) => injection.sl<current.CurrentPlayerTagBloc>()
        ..add(current.SaveCurrentPlayerTagEvent(playerTag: CurrentPlayerTag(playerTag: 'PPGRVJJQ')))
        // create: (context) => injection.sl<net.NetworkConnectionCheckerBloc>()
        //   ..add(net.ConnectionCheckerEvent()),
      ),
      BlocProvider(
        create: (context) =>
            injection.sl<version.VersionCheckerBloc>()..add(version.SaveCurrentVersionEvent()),
      ),
      BlocProvider(
        create: (context) =>
            injection.sl<PlayerBloc>()..add(GetPlayerEvent('PPGRVJJQ')),
      ),

    ];

    // final _router = sl<Router>();
    //
    // return MultiBlocProvider(
    //   providers: _providers,
    //   child: MaterialApp.router(
    //     title: AppTexts.body.appTitle,
    //     routerConfig: _router.config(),
    //     debugShowCheckedModeBanner: false,
    //     theme:
    //         ThemeData(fontFamily: GoogleFonts.zillaSlab().fontFamily).copyWith(
    //       primaryColor: AppColors.main.primaryColor,
    //     ),
    //   ),
    // );
    return MultiBlocProvider(
      providers: _providers,
      child: MaterialApp(
        title: AppTexts.body.appTitle,
        home: BlocBuilder<current.CurrentPlayerTagBloc, current.CurrentPlayerTagState>(
          bloc: current.CurrentPlayerTagBloc(repository: sl()),
          builder: (context, state) {
            logger.d(state);
          if (state is current.Empty) {
            return Sc(child: Text('Empty'));
          }  else if (state is current.Loading) {
            return Sc(child: Text('Loading'));
          }  else if ( state is current.Loaded) {
            return Sc(child: Text(state.playerTag.playerTag));
          }

          return Sc(child: Text('Else'));
        },),
        showPerformanceOverlay: true,
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(fontFamily: GoogleFonts.zillaSlab().fontFamily).copyWith(
          primaryColor: AppColors.main.primaryColor,
        ),
      ),
    );


  }
}

class Sc extends StatelessWidget {
  const Sc({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: child,
      ),
    );
  }
}



SystemUiOverlayStyle _systemUiOverlayStyle() {
  return SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor:
        AppColors.main.primaryColor, // navigation bar color
    statusBarColor: Colors.white60, // status bar color
  );
}
