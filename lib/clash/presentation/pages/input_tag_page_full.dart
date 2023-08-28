import 'package:auto_route/annotations.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart' as injection;
import '../bloc/player/bloc.dart';
import '../bloc/validatetag/bloc.dart';
import '../widgets/widgets.dart';

@RoutePage()
class InputTagPageFull extends StatelessWidget {
  const InputTagPageFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var playerProviders = [
      BlocProvider(
          create: (context) => injection.sl<PlayerBloc>()), //Fix Step: remove
      BlocProvider(create: (context) => injection.sl<ValidateTagBloc>()),
    ];
    return MultiBlocProvider(
      providers: playerProviders,
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            backgroundColor: Color(0xFF190F2A),
            content: Text('Tap back again to leave'),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(screenWidth / 7),
              child: InputTag(),
            ),
          ),
        ),
        bottomSheet: NotConnectedMessageWidget(),
      ),
    );
  }
}
