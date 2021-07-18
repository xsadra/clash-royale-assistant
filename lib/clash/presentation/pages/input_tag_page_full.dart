import 'package:clash_royale_assistant/clash/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart' as injection;
import '../bloc/player/bloc.dart';
import '../bloc/validatetag/bloc.dart';
import '../widgets/input_tag.dart';

class InputTagPageFull extends StatelessWidget {
  const InputTagPageFull({Key key}) : super(key: key);

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
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(screenWidth / 7),
            child: InputTag(),
          ),
        ),
        bottomSheet: NotConnectedMessageWidget(),
      ),
    );
  }
}
