import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../../../core/routes/router.gr.dart';
import '../bloc/currentplayertag/bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrentPlayerTagBloc, CurrentPlayerTagState>(
      listener: (context, state) {
        if (state is Empty) {
          ExtendedNavigator.of(context)
              .replace(Routes.InputTagPageFullScreenRoute);
        } else if (state is Loaded) {
          ExtendedNavigator.of(context).replace(Routes.PlayerPageRoute);
        } else {
          log('Else State ' + state.runtimeType.toString(), name: 'SplashPage');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.splash.backgroundColor,
        body: Center(
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
