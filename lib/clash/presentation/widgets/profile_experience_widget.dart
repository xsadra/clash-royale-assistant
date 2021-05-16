import 'package:flutter/material.dart';

import '../../../core/platform/assets_controller.dart';

class ProfileExperienceWidget extends StatelessWidget {
  const ProfileExperienceWidget({
    @required this.expLevel,
    Key key,
  }) : super(key: key);

  final String expLevel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.experience,
          height: 32,
          width: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1, bottom: 1),
          child: Text(
            expLevel,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
