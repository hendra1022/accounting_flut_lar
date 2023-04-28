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
    if (Get.currentRoute != RoutesPath.item) {
      Get.offNamedUntil(RoutesPath.item, (route) => route.settings.name == RoutesPath.dashboard);
    }
  }

  toItemCategoryPage() {
    if (Get.currentRoute != RoutesPath.itemCategory) {
      Get.offNamedUntil(RoutesPath.itemCategory, (route) => route.settings.name == RoutesPath.dashboard);
    }
  }

  toSupplierPage() {
    if (Get.currentRoute != RoutesPath.supplier) {
      Get.offNamedUntil(RoutesPath.supplier, (route) => route.settings.name == RoutesPath.dashboard);
    }
  }

  toCustomerPage() {
    if (Get.currentRoute != RoutesPath.customer) {
      Get.offNamedUntil(RoutesPath.customer, (route) => route.settings.name == RoutesPath.dashboard);
    }
  }

  toCustomerTypePage() {
    if (Get.currentRoute != RoutesPath.customerType) {
      Get.offNamedUntil(RoutesPath.customerType, (route) => route.settings.name == RoutesPath.dashboard);
    }
  }

  toPurchasePage() {
    if (Get.currentRoute != RoutesPath.purchase) {
      Get.offNamedUntil(RoutesPath.purchase, (route) => route.settings.name == RoutesPath.dashboard);
    }
  }

  toSalesPage() {
    if (Get.currentRoute != RoutesPath.sales) {
      Get.offNamedUntil(RoutesPath.sales, (route) => route.settings.name == RoutesPath.dashboard);
    }
  }

  toItemDetailPage(int itemId) {
    Get.toNamed(
      RoutesPath.itemDetail,
      arguments: {
        PrefConst.keyArgsItemId: itemId,
      },
    );
  }

  toItemCreatePage({int itemId = 0}) {
    Get.toNamed(RoutesPath.itemCreate, arguments: {
      PrefConst.keyArgsItemId: itemId,
    });
  }

  toItemCategoryDetailPage(int itemId) {
    Get.toNamed(
      RoutesPath.itemCategoryDetail,
      arguments: {
        PrefConst.keyArgsItemCatId: itemId,
      },
    );
  }

  toItemCategoryCreatePage({int itemCat = 0}) {
    Get.toNamed(RoutesPath.itemCategoryCreate, arguments: {
      PrefConst.keyArgsItemCatId: itemCat,
    });
  }

  toCustomerDetailPage(int custId) {
    Get.toNamed(
      RoutesPath.customerDetail,
      arguments: {
        PrefConst.keyArgsCusId: custId,
      },
    );
  }

  toCustomerCreatePage({int custId = 0}) {
    Get.toNamed(RoutesPath.customerCreate, arguments: {
      PrefConst.keyArgsCusId: custId,
    });
  }

  toCustomerTypeDetailPage(int custTypeId) {
    Get.toNamed(
      RoutesPath.customerTypeDetail,
      arguments: {
        PrefConst.keyArgsCusTypeId: custTypeId,
      },
    );
  }

  toCustomerTypeCreatePage({int custTypeId = 0}) {
    Get.toNamed(RoutesPath.customerTypeCreate, arguments: {
      PrefConst.keyArgsCusTypeId: custTypeId,
    });
  }

  toCustomerTypeLookup({required Function(dynamic) callback}) {
    Get.toNamed(RoutesPath.customerTypeLookUp)!.then(callback);
  }

  toSupplierDetailPage(int suppId) {
    Get.toNamed(
      RoutesPath.supplierDetail,
      arguments: {
        PrefConst.keyArgsSupId: suppId,
      },
    );
  }

  toSupplierCreatePage({int suppId = 0}) {
    Get.toNamed(RoutesPath.supplierCreate, arguments: {
      PrefConst.keyArgsSupId: suppId,
    });
  }

  toPurchaseDetailPage(int purcId) {
    Get.toNamed(
      RoutesPath.purchaseDetail,
      arguments: {
        PrefConst.keyArgsPurcId: purcId,
      },
    );
  }

  toPurchaseCreatePage() {
    Get.toNamed(RoutesPath.purchaseCreate);
  }

  toSalesDetailPage(int salesId) {
    Get.toNamed(
      RoutesPath.salesDetail,
      arguments: {
        PrefConst.keyArgsSalesId: salesId,
      },
    );
  }

  toSalesCreatePage() {
    Get.toNamed(RoutesPath.salesCreate);
  }
}
