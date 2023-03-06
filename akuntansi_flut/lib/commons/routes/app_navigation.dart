import 'package:get/get.dart';

import 'app_pages.dart';

class VNavigation {
  offAllToNavigatorPage() {
    Get.offAllNamed(RoutesPath.navigator);
  }

  toDashboard() {
    Get.toNamed(RoutesPath.dashboard);
  }

  // offToSearchResultPage(String keyword, String categoryId) {
  //   Get.offNamed(
  //     RoutesPath.searchResultPage,
  //     arguments: {
  //       PrefConst.keyArgSearchKeyword: keyword,
  //       PrefConst.keyArgsSelectedCatId: categoryId,
  //     },
  //   );
  // }
}
