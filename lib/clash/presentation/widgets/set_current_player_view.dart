import 'package:flutter/material.dart';

import 'input_tag.dart';

class SetCurrentPlayerView extends StatelessWidget {
  const SetCurrentPlayerView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(screenWidth / 7),
        child: InputTag(),
      ),
    );
  }
}
