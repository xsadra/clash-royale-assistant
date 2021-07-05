import 'package:flutter/material.dart';

import '../../../core/constants/consts.dart';
import 'widgets.dart';

class EmptyDisplay extends StatelessWidget {
  const EmptyDisplay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RefreshPlayer(),
          MessageDisplay(message: AppTexts.uiMessages.noData),
        ],
      ),
    );
  }
}
