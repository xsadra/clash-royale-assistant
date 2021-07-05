import 'package:flutter/material.dart' hide Card;

import '../../../core/constants/consts.dart';
import 'widgets.dart';

class OneToOneBattleVerticalDivider extends StatelessWidget {
  const OneToOneBattleVerticalDivider({
    Key key,
    @required this.color,
    @required this.height,
    @required this.thickness,
    @required this.text,
  }) : super(key: key);

  final Color color;
  final double height;
  final double thickness;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalDividerWidget(
          color: color,
          height: height,
          thickness: thickness,
        ),
        AppStyles.sizedBox.height6,
        Container(
          decoration: BoxDecoration(
            //color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white54, // red as border color
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 9, color: Colors.black),
          ),
        ),
        AppStyles.sizedBox.height6,
        VerticalDividerWidget(
          color: color,
          height: height,
          thickness: thickness,
        ),
      ],
    );
  }
}
