import 'package:flutter/material.dart';

import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/profile.dart';
import 'widgets.dart';

class UserProfileName extends StatelessWidget {
  const UserProfileName({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileExperienceWidget(expLevel: profile.expLevel.toString()),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profile.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(
              profile.tag,
              style: TextStyle(fontSize: 9, color: Colors.green),
            ),
          ],
        ),
        if (profile.expLevel == 13) ...[
          SizedBox(width: 16),
          Row(
            children: [
              Image.asset(Assets.starLevel, width: 24, height: 24),
              SizedBox(width: 6),
              Text(
                profile.starPoints.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(-1, -1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 6,
                        offset: Offset(-1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(1, -1)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
