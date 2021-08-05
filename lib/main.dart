import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'clash/presentation/bloc/currentplayertag/bloc.dart';
import 'clash/presentation/bloc/network_connection_checker/bloc.dart';
import 'clash/presentation/bloc/version_checker/bloc.dart';
import 'core/constants/consts.dart';
import 'core/routes/router.gr.dart';
import 'injection_container.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  SystemChrome.setSystemUIOverlayStyle(_systemUiOverlayStyle());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _providers = [
      BlocProvider(
        create: (context) => injection.sl<CurrentPlayerTagBloc>()
          ..add(GetCurrentPlayerTagEvent()),
      ),
      BlocProvider(
        create: (context) => injection.sl<NetworkConnectionCheckerBloc>()
          ..add(ConnectionCheckerEvent()),
      ),
      BlocProvider(
        create: (context) =>
            injection.sl<VersionCheckerBloc>()..add(SaveCurrentVersionEvent()),
      ),
    ];
    return MultiBlocProvider(
      providers: _providers,
      child: MaterialApp(
        title: AppTexts.body.appTitle,
        builder: ExtendedNavigator(router: Router()),
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(fontFamily: GoogleFonts.zillaSlab().fontFamily).copyWith(
          primaryColor: AppColors.main.primaryColor,
        ),
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
