import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/texts.dart';
import '../../../injection_container.dart' as injection;
import '../bloc/player/bloc.dart';
import '../bloc/validatetag/bloc.dart';
import '../widgets/input_tag.dart';
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
          title: Text(APP_TITLE),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(screenWidth / 7),
            child: InputTag(),
          ),
        ),
        bottomNavigationBar: BottomNavBar(initialActiveIndex: 1),
      ),
    );
  }
}
