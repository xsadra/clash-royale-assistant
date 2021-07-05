import 'package:flutter/material.dart';

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({
    Key key,
    @required this.height,
    @required this.thickness,
    @required this.color,
  }) : super(key: key);

  final double height;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: thickness,
      color: color,
      margin: const EdgeInsets.only(left: 1.0, right: 1.0),
    );
  }
}
