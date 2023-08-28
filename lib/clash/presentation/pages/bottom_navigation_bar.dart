import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/consts.dart';
import '../../../core/routes/router.gr.dart';
import '../bloc/network_connection_checker/bloc.dart';

@RoutePage()
class BottomNavBar extends StatelessWidget {
  final int initialActiveIndex;

  const BottomNavBar({
    Key? key,
    required this.initialActiveIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NetworkConnectionCheckerBloc>().add(ConnectionCheckerEvent());
    return ConvexAppBar.badge(
      {},
      items: [
        TabItem(icon: Icons.person, title: AppTexts.ui.player),
        TabItem(icon: Icons.search, title: AppTexts.ui.search),
      ],
      badgeMargin: EdgeInsets.only(bottom: 36, left: 30),
      height: 48.0,
      curveSize: 74.0,
      style: TabStyle.reactCircle,
      backgroundColor: AppColors.bottomNavBar.backgroundColor,
      top: -14,
      initialActiveIndex: initialActiveIndex,
      onTap: (int pageIndex) {
        if (pageIndex == 0) {
          // Fix Step: get local data instead of Live
          context.replaceRoute(PlayerRoute());
        } else if (pageIndex == 1) {
          context.replaceRoute(InputTagRoute());
        }
      },
    );
  }
}
