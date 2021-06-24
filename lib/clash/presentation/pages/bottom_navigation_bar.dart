import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart' hide Router;

import '../../../core/constants/consts.dart';
import '../../../core/routes/router.gr.dart';

class BottomNavBar extends StatelessWidget {
  final int initialActiveIndex;

  const BottomNavBar({
    Key key,
    @required this.initialActiveIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar.badge(
      {},
      items: [
        TabItem(icon: Icons.person, title: AppText.ui.player),
        TabItem(icon: Icons.search, title: AppText.ui.search),
      ],
      badgeMargin: EdgeInsets.only(bottom: 36, left: 30),
      height: 48.0,
      curveSize: 74.0,
      style: TabStyle.reactCircle,
      backgroundColor: AppColors.bottomNavBar.backgroundColor,
      top: -14,
      initialActiveIndex: initialActiveIndex,
      onTap: (int pageIndex) {
        log('pageIndex: ' + pageIndex.toString(), name: 'BottomNavBar');

        if (pageIndex == 0) {
          // Fix Step: get local data instead of Live
          ExtendedNavigator.of(context).replace(Routes.PlayerPageRoute);
        } else if (pageIndex == 1) {
          ExtendedNavigator.of(context).replace(Routes.InputTagPageRoute);
        }
      },
    );
  }
}
