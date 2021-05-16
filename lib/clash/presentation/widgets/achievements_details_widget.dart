import 'package:clash_royale_assistant/clash/domain/entities/profile.dart'
    hide Card;
import 'package:clash_royale_assistant/clash/presentation/bloc/profile/bloc.dart';
import 'package:clash_royale_assistant/core/platform/assets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'stat_header_widget.dart';

class AchievementsDetails extends StatelessWidget {
  const AchievementsDetails({Key key, this.state}) : super(key: key);
  final Loaded state;

  @override
  Widget build(BuildContext context) {
    List<Achievement> achieves = state.profile.achievements;
    // cards.sort((b, a) =>
    //     (a.level + 13 - a.maxLevel).compareTo(b.level + 13 - b.maxLevel));
    // var newList = groupBy(
    //     cards, (card) => (card as Card).level + 13 - (card as Card).maxLevel);
    // newList.map((key, value) => null).

    int currentDeckColumnCount = 2;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisSize: MainAxisSize.min,
      children: [
        StatHeader(
            icon: Icons.playlist_add_check_rounded, title: 'Achievements:'),
        AnimationLimiter(
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            //mainAxisSpacing: 8,
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
                      child: Card(
                        margin: EdgeInsets.all(8.0),
                        shadowColor: Colors.black54,
                        elevation: 9,
                        color: Colors.black12,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    achieve.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Center(
                                  child: Text(
                                    achieve.info,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      letterSpacing: 1.5,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Stars: '),
                                      if (achieve.stars == 0) Text('Not yet!'),
                                      for (var index = 0;
                                          index < (achieve.stars ?? 0);
                                          index++)
                                        Image.asset(Assets.starLevel,
                                            width: 16, height: 16),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Achieved: '),
                                      Text(achieve.value.toString()),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Target: '),
                                      Text(achieve.target.toString()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
