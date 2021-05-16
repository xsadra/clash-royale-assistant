import 'package:flutter/material.dart';

class StatHeader extends StatelessWidget {
  const StatHeader({
    @required this.icon,
    @required this.title,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 4),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
