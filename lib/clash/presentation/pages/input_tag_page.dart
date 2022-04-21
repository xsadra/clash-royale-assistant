import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../../../injection_container.dart' as injection;
import '../bloc/player/bloc.dart';
import '../bloc/validatetag/bloc.dart';
import '../widgets/widgets.dart';
import 'bottom_navigation_bar.dart';

class InputTagPage extends StatelessWidget {
  const InputTagPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var playerProviders = [
      BlocProvider(create: (context) => injection.sl<PlayerBloc>()),
      BlocProvider(create: (context) => injection.sl<ValidateTagBloc>()),
    ];
    return MultiBlocProvider(
      providers: playerProviders,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.main.primaryColor,
          title: Text(AppTexts.body.appTitle),
        ),
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            backgroundColor: Color(0xFF190F2A),
            content: Text('Tap back again to leave'),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth / 7),
              child: InputTag(),
            ),
          ),
        ),
        bottomSheet: NotConnectedMessageWidget(),
        bottomNavigationBar: BottomNavBar(initialActiveIndex: 1),
      ),
    );
  }
}
