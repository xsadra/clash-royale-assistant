import 'package:auto_route/auto_route_annotations.dart';

import '../../clash/presentation/pages/input_tag_page.dart';
import '../../clash/presentation/pages/input_tag_page_full.dart';
import '../../clash/presentation/pages/player_page.dart';
import '../../clash/presentation/pages/splash_page.dart';
import '../constants/consts.dart';

@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      MaterialRoute(
        page: SplashPage,
        name: AppRouteTexts.SPLASH_PAGE_ROUTE,
        initial: true,
      ),
      MaterialRoute(
        page: InputTagPage,
        name: AppRouteTexts.INPUT_TAG_PAGE_ROUTE,
      ),
      MaterialRoute(
        page: InputTagPageFull,
        name: AppRouteTexts.INPUT_TAG_PAGE_FULL_SCREEN_ROUTE,
        fullscreenDialog: true,
      ),
      MaterialRoute(
        page: PlayerPage,
        name: AppRouteTexts.PLAYER_PAGE_ROUTE,
      ),
    ])
class $Router {}
