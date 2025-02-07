import 'package:auto_route/auto_route.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/routes/route_config.gr.dart';
import 'package:flutter_mvvm_riverpod_boilerplate/routes/route_path.dart';

// part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          path: RoutePath.home,
        ),
      ];
}
