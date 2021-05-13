import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar.badge(
      {},
      items: [
        TabItem(icon: Icons.person, title: 'Profile'),
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
      onTap: (int i) => print('click index=$i'),
    );
  }
}
