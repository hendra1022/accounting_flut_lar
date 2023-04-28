class ApiUrl {
  static const baseUrl = "http://127.0.0.1/api/";

  // static const LOGIN = "$BASE_URL${V1}apps/auth";
  // static const IMG_URL = "http://nextbasis.id:8080/ssb/image/item/";
  // static const IMG_URL_AWS = "https://sidomuncul.s3.ap-southeast-3.amazonaws.com/";
  // static const IMG_URL_AWS_ITEM = "https://sidomuncul.s3.ap-southeast-3.amazonaws.com/image/item/";

  static const customerType = "${baseUrl}customer_type";
  static const customerTypeFilter = "$customerType/filter";

  static const customer = "${baseUrl}customer";
  static const customerFilter = "$customer/filter";

  static const supplier = "${baseUrl}supplier";
  static const supplierFilter = "$supplier/filter";

  static const itemCategory = "${baseUrl}item_category";
  static const itemCategoryFilter = "$itemCategory/filter";

  static const item = "${baseUrl}item";
  static const itemFilter = "$item/filter";
}
