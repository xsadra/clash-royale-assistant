import 'package:auto_route/auto_route_annotations.dart';

import '../../clash/presentation/pages/input_tag_page.dart';
import '../../clash/presentation/pages/input_tag_page_full.dart';
import '../../clash/presentation/pages/player_page.dart';
import '../../clash/presentation/pages/splash_page.dart';

@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      MaterialRoute(
        page: SplashPage,
        name: 'SplashPageRoute',
        initial: true,
      ),
      MaterialRoute(
        page: InputTagPage,
        name: 'InputTagPageRoute',
      ),
      MaterialRoute(
        page: InputTagPageFull,
        name: 'InputTagPageFullScreenRoute',
        fullscreenDialog: true,
      ),
      MaterialRoute(
        page: PlayerPage,
        name: 'PlayerPageRoute',
      ),
    ])
class $Router {}
