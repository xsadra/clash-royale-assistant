import 'package:flutter/material.dart';

class StatTile extends StatelessWidget {
  const StatTile({
    Key key,
    @required this.field,
    @required this.value,
  }) : super(key: key);

  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0, bottom: 2),
      child: Row(
        children: [
          Text(
            field,
            style: TextStyle(fontSize: 13),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
