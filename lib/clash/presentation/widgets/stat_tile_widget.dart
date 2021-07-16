import 'package:clash_royale_assistant/core/constants/consts.dart';
import 'package:flutter/material.dart';

class StatTile extends StatelessWidget {
  const StatTile({
    Key key,
    @required this.field,
    @required this.value,
    this.fieldColor,
    this.valueColor,
  }) : super(key: key);

  final String field;
  final String value;
  final Color fieldColor;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36.0, bottom: 2, right: 8.0),
      child: Row(
        children: [
          Text(
            field,
            style: TextStyle(fontSize: 13, color: fieldColor),
          ),
          AppStyles.sizedBox.width8,
          Expanded(
            child: Container(
              height: 0.5,
              color: Colors.black12,
              margin: const EdgeInsets.only(left: 1.0, right: 1.0),
            ),
          ),
          AppStyles.sizedBox.width8,
          Text(
            value,
            style: TextStyle(fontSize: 13, color: valueColor),
          ),
        ],
      ),
    );
  }
}
