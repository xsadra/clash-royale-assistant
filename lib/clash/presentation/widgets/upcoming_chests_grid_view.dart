import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../domain/entities/upcoming_chest.dart';
import '../bloc/upcomingchest/bloc.dart';
import 'upcoming_chest_item.dart';

class UpcomingChestsGridView extends StatelessWidget {
  final Loaded state;

  UpcomingChestsGridView({
    this.state,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int columnCount = 4;
    return Scaffold(
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: columnCount,
          children: List.generate(
            state.upcomingChests.length,
            (int index) {
              UpcomingChest chest = state.upcomingChests.elementAt(index);
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 575),
                columnCount: columnCount,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: UpcomingChestItem(chest: chest),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
