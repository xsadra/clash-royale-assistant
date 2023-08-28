import 'package:auto_route/auto_route.dart';
import 'package:clash_royale_assistant/core/routes/router.gr.dart';

import '../../clash/presentation/pages/input_tag_page.dart';
import '../../clash/presentation/pages/input_tag_page_full.dart';
import '../../clash/presentation/pages/player_page.dart';
import '../../clash/presentation/pages/splash_page.dart';
import '../constants/consts.dart';
//
// @MaterialAutoRouter(
//     generateNavigationHelperExtension: true,
//     routes: <AutoRoute>[
//       MaterialRoute(
//         page: SplashPage,
//         name: AppRouteTexts.SPLASH_PAGE_ROUTE,
//         initial: true,
//       ),
//       MaterialRoute(
//         page: InputTagPage,
//         name: AppRouteTexts.INPUT_TAG_PAGE_ROUTE,
//       ),
//       MaterialRoute(
//         page: InputTagPageFull,
//         name: AppRouteTexts.INPUT_TAG_PAGE_FULL_SCREEN_ROUTE,
//         fullscreenDialog: true,
//       ),
//       MaterialRoute(
//         page: PlayerPage,
//         name: AppRouteTexts.PLAYER_PAGE_ROUTE,
//       ),
//     ])
// class $Router {}
@AutoRouterConfig(
 // generateNavigationHelperExtension: true,
)
class Router extends $Router {
  @override
  RouteType get defaultRouteType => RouteType.material();
  @override
  final List<AutoRoute> routes = [
    MaterialRoute(page: SplashRoute.page, path: '/', initial: true),
    MaterialRoute(page: InputTagRoute.page),
    MaterialRoute(
        page: InputTagRouteFull.page, fullscreenDialog: true),
    MaterialRoute(page: PlayerRoute.page),
  ];
}
