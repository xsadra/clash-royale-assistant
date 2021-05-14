import 'package:flutter/material.dart';

import '../../../core/platform/assets_controller.dart';
import '../../domain/entities/upcoming_chest.dart';

class UpcomingChestItem extends StatelessWidget {
  const UpcomingChestItem({
    Key key,
    @required this.chest,
  }) : super(key: key);

  final UpcomingChest chest;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 80.0,
        width: 80.0,
        child: Stack(
          children: [
            Image.asset(Assets.chestNameToPath(chest.name)),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 18.0),
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                (chest.index == 0) ? 'Next' : '+' + (chest.index).toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 3,
                        offset: Offset(-2, 3)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(-2, 3)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(-2, 3)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(-1, -1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(-1, 1)),
                    Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(1, -1)),
                  ],
                ),
              ),
            ),
          ],
        ),
        // title: Text(chest.name),
        // trailing: Text((chest.index + 1).toString()),
        // leading: Image.asset(chestNameToPath(chest.name)),
      ),
    );
  }
}
