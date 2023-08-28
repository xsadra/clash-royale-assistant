import 'package:flutter/material.dart';

import '../../../core/platform/assets_controller.dart';

class PlayerExperienceWidget extends StatelessWidget {
  const PlayerExperienceWidget({
    required this.expLevel,
    Key? key,
  }) : super(key: key);

  final String expLevel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          AppAssets.paths.experience,
          height: 32,
          width: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 1, bottom: 6),
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
