import 'package:flutter/material.dart';

import '../../domain/entities/upcoming_chest.dart';
import '../bloc/upcomingchest/bloc.dart';
import 'upcoming_chest_item.dart';

class UpcomingChestsListView extends StatelessWidget {
  final Loaded state;

  UpcomingChestsListView({
    this.state,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //scrollDirection: Axis.horizontal,
      itemCount: state.upcomingChests.items.length,
      itemBuilder: (context, index) {
        UpcomingChest chest = state.upcomingChests.items.elementAt(index);
        return UpcomingChestItem(chest: chest);
      },
    );
  }
}
