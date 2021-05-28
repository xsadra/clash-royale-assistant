import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart' hide Router;

import '../../../core/routes/router.gr.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar.badge(
      {},
      items: [
        TabItem(icon: Icons.person, title: 'Player'),
        TabItem(icon: Icons.search, title: 'Search'),
      ],
      badgeMargin: EdgeInsets.only(bottom: 36, left: 30),
      height: 48.0,
      curveSize: 74.0,
      style: TabStyle.reactCircle,
      backgroundColor: Color(0xFF190F2A),
      top: -14,
      initialActiveIndex: 0,
      //optional, default as 0
      onTap: (int pageIndex) {
        if (pageIndex == 0) {
          ExtendedNavigator.of(context).replace(Routes.HomePageRoute);
        } else if (pageIndex == 1) {
          ExtendedNavigator.of(context).pushInputTagPageRoute();
        }
      },
    );
  }
}
