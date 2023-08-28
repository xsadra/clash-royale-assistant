import 'package:flutter/material.dart';

import '../../../core/constants/consts.dart';
import 'widgets.dart';

class Stat extends StatelessWidget {
  const Stat({
    Key? key,
    required this.header,
    required this.tiles,
  }) : super(key: key);

  final StatHeader header;
  final List<StatTile> tiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header,
        AppStyles.sizedBox.height4,
        for (var tile in tiles) tile,
      ],
    );
  }
}
