import 'package:get/get.dart';

import '../../utils/constants.dart';
import 'app_pages.dart';

class VNavigation {
  offAllToNavigatorPage() {
    Get.offAllNamed(RoutesPath.navigator);
  }

  toDashboard() {
    Get.toNamed(RoutesPath.dashboard);
  }

  toItemDetailPage(int itemId) {
    Get.toNamed(
      RoutesPath.itemDetail,
      arguments: {
        PrefConst.keyArgsItemId: itemId,
      },
    );
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
