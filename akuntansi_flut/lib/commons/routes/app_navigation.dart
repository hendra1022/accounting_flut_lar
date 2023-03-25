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
    Get.offNamedUntil(RoutesPath.dashboard, (route) => route.settings.name == RoutesPath.dashboard);
  }

  toItemPage() {
    Get.offNamedUntil(RoutesPath.item, (route) => route.settings.name == RoutesPath.dashboard);
  }

  toItemCategoryPage() {
    Get.offNamedUntil(RoutesPath.itemCategory, (route) => route.settings.name == RoutesPath.dashboard);
  }

  toSupplierPage() {
    Get.offNamedUntil(RoutesPath.supplier, (route) => route.settings.name == RoutesPath.dashboard);
  }

  toCustomerPage() {
    Get.offNamedUntil(RoutesPath.customer, (route) => route.settings.name == RoutesPath.dashboard);
  }

  toPurchasePage() {
    Get.offNamedUntil(RoutesPath.purchase, (route) => route.settings.name == RoutesPath.dashboard);
  }

  toSalesPage() {
    Get.offNamedUntil(RoutesPath.sales, (route) => route.settings.name == RoutesPath.dashboard);
  }

  toItemDetailPage(int itemId) {
    Get.toNamed(
      RoutesPath.itemDetail,
      arguments: {
        PrefConst.keyArgsItemId: itemId,
      },
    );
  }

  toItemCreatePage() {
    Get.toNamed(RoutesPath.itemCreate);
  }

  toItemCategoryDetailPage(int itemId) {
    Get.toNamed(
      RoutesPath.itemCategoryDetail,
      arguments: {
        PrefConst.keyArgsCatId: itemId,
      },
    );
  }

  toItemCategoryCreatePage() {
    Get.toNamed(RoutesPath.itemCategoryCreate);
  }

  toCustomerDetailPage(int custId) {
    Get.toNamed(
      RoutesPath.customerDetail,
      arguments: {
        PrefConst.keyArgsCusId: custId,
      },
    );
  }

  toCustomerCreatePage() {
    Get.toNamed(RoutesPath.customerCreate);
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
