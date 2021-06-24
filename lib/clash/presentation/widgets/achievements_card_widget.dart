import 'package:flutter/material.dart';

import '../../../core/constants/consts.dart';
import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/player.dart';

class AchievementsCard extends StatelessWidget {
  const AchievementsCard({
    Key key,
    @required this.achieve,
  }) : super(key: key);

  final Achievement achieve;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shadowColor: Colors.black54,
      elevation: 9,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      // color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _achieveName(),
              AppWidgets.sizedBox.height8,
              _achieveInfo(),
              AppWidgets.sizedBox.height16,
              _achieveStars(),
              AppWidgets.sizedBox.height6,
              _achieved(),
              AppWidgets.sizedBox.height6,
              _target(),
            ],
          ),
        ),
      ),
    );
  }

  Center _target() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppText.ui.targetCol,
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              letterSpacing: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            achieve.target.toString(),
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              letterSpacing: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Center _achieved() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: AppText.ui.achievedCol,
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: 1.5,
            fontStyle: FontStyle.italic,
          ),
          children: [
            TextSpan(
              text: achieve.value.toString(),
              style: TextStyle(
                color: (achieve.value < achieve.target)
                    ? Colors.red
                    : Colors.green,
                fontWeight: (achieve.value < achieve.target)
                    ? FontWeight.w600
                    : FontWeight.bold,
                fontSize: 12,
                letterSpacing: 1.5,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Center _achieveStars() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppText.ui.starsCol,
            style: TextStyle(
              color: Color(0XFF826001),
              fontWeight: FontWeight.w600,
              fontSize: 13,
              letterSpacing: 1.5,
              fontStyle: FontStyle.italic,
            ),
          ),
          if (achieve.stars == 0)
            Text(
              AppText.ui.notYet,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                letterSpacing: 1.5,
                fontStyle: FontStyle.italic,
              ),
            ),
          for (var index = 0; index < (achieve.stars ?? 0); index++)
            Image.asset(AppAssets.paths.starLevel, width: 16, height: 16),
        ],
      ),
    );
  }

  Center _achieveInfo() {
    return Center(
      child: Text(
        achieve.info,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF183C45),
          fontWeight: FontWeight.w600,
          fontSize: 12,
          letterSpacing: 1.5,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Container _achieveName() {
    return Container(
      child: Center(
        child: Text(
          achieve.name,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
