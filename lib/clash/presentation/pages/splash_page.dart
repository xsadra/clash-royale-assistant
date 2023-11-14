import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:clash_royale_assistant/core/logs/logger.dart';
import 'package:clash_royale_assistant/core/routes/router.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../../../core/routes/router.gr.dart';
import '../bloc/currentplayertag/bloc.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrentPlayerTagBloc, CurrentPlayerTagState>(
      listener: (context, state) {
        logger.e(state);
        // var _router = sl<Router>();
        var _router = Router();
        if (state is Empty) {
          // ExtendedNavigator.of(context)
          //     .replace(Routes.InputTagPageFullScreenRoute);
          logShort.e('State is Empty');
          try{
            logger.e('try to navigate!');
            logger.e( _router.toString());
            logger.e( _router.routes.join(' - '));
            // _router.push(InputTagRouteFull());
            _router.pop();
            print('pop');
            _router.push(InputTagRoute(), onFailure: (failure) {
              print(failure);
            },);
            logger.i(_router.canNavigateBack);
            // _router.pushNamed('InputTagRouteFull', onFailure: (failure) {
            //   print(failure);
            // },);
            // logger.e('message');
          }catch(e){
            logger.e('can not navigate');
          }
        } else if (state is Loaded) {
          _router.replace(PlayerRoute());
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
