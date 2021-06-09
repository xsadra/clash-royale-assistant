import 'package:clash_royale_assistant/clash/presentation/bloc/battles/bloc.dart';
import 'package:clash_royale_assistant/clash/presentation/bloc/upcomingchest/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/bloc/player/bloc.dart';

class RefreshPlayer extends StatelessWidget {
  const RefreshPlayer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<PlayerBloc>().add(GetPlayerEvent('%23PPGRVJJQ'));
          context
              .read<UpcomingChestsBloc>()
              .add(GetUpcomingChestsEvent('%23PPGRVJJQ'));
          context.read<BattlesBloc>().add(GetBattlesEvent('%23PPGRVJJQ'));
        }, // Remove Step:
        child: Icon(Icons.refresh),
      ),
    );
  }
}
