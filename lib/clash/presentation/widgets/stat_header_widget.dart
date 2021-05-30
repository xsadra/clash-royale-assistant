import 'package:flutter/material.dart';

class StatHeader extends StatelessWidget {
  const StatHeader({
    @required this.icon,
    @required this.title,
    this.color,
    this.textColor,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color ?? null),
        SizedBox(width: 4),
        Text(
          title,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: textColor ?? null),
        ),
      ],
    );
  }
}
