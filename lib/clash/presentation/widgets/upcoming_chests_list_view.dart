import 'package:flutter/material.dart';

import '../../domain/entities/upcoming_chest.dart';
import '../bloc/upcomingchest/bloc.dart';
import 'widgets.dart';

class UpcomingChestsListView extends StatelessWidget {
  final Loaded state;

  UpcomingChestsListView({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.upcomingChests.items!.length,
      itemBuilder: (context, index) {
        UpcomingChest chest = state.upcomingChests.items!.elementAt(index);
        return UpcomingChestItem(chest: chest);
      },
    );
  }
}
