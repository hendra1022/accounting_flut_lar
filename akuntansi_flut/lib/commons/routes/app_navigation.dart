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

  toCustomerTypePage() {
    Get.offNamedUntil(RoutesPath.customerType, (route) => route.settings.name == RoutesPath.dashboard);
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

  toSupplierCreatePage() {
    Get.toNamed(RoutesPath.supplierCreate);
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
