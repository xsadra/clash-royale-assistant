import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../core/constants/consts.dart';
import '../../domain/entities/player.dart';
import '../../presentation/bloc/player/bloc.dart';
import 'widgets.dart';

class AchievementsDetails extends StatelessWidget {
  const AchievementsDetails({Key key, this.state}) : super(key: key);
  final Loaded state;

  @override
  Widget build(BuildContext context) {
    List<Achievement> achieves = state.player.achievements;
    int currentDeckColumnCount = 2;
    return Column(
      children: [
        StatHeader(
            icon: Icons.playlist_add_check_rounded,
            title: AppText.ui.achievementsCol),
        AnimationLimiter(
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: currentDeckColumnCount,
            children: List.generate(
              achieves.length,
              (int index) {
                Achievement achieve = achieves.elementAt(index);
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 575),
                  columnCount: currentDeckColumnCount,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: AchievementsCard(achieve: achieve),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
