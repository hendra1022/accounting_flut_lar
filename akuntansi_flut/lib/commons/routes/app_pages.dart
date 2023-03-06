import 'package:get/get.dart';

import '../../modules/dashboard/dashboard.dart';
import '../../modules/login/login.dart';
import '../middlewares/middlewares.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = RoutesPath.login;

  static final routes = [
    GetPage(
      name: RoutesPath.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      middlewares: [
        RouteAuthMiddleware(priority: 1),
      ],
    ),
    GetPage(
      name: RoutesPath.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
  ];
}
