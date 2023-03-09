import 'package:get/get.dart';

import '../../utils/constants.dart';
import 'app_pages.dart';

class VNavigation {
  offAllToDashboardPage() {
    Get.offAllNamed(RoutesPath.dashboard);
  }

  offAllToLoginPage() {
    Get.offAllNamed(RoutesPath.login);
  }

  toDashboardPage() {
    Get.toNamed(RoutesPath.dashboard);
  }

  toItemPage() {
    Get.toNamed(RoutesPath.item);
  }

  toItemCategoryPage() {
    Get.toNamed(RoutesPath.itemCategory);
  }

  toSupplierPage() {
    Get.toNamed(RoutesPath.supplier);
  }

  toCustomerPage() {
    Get.toNamed(RoutesPath.customer);
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
