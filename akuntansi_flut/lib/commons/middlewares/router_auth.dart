import 'package:akuntansi_flut/commons/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../store/store.dart';

class RouteAuthMiddleware extends GetMiddleware {
  RouteAuthMiddleware({required priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.getStatusLogin()) {
      return const RouteSettings(name: RoutesPath.dashboard);
    } else {
      return null;
      // return const RouteSettings(name: RoutesPath.login);
    }
  }
}
