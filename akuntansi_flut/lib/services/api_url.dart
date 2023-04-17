class ApiUrl {
  static const baseUrl = "http://127.0.0.1/api/";

  // static const LOGIN = "$BASE_URL${V1}apps/auth";
  // static const IMG_URL = "http://nextbasis.id:8080/ssb/image/item/";
  // static const IMG_URL_AWS = "https://sidomuncul.s3.ap-southeast-3.amazonaws.com/";
  // static const IMG_URL_AWS_ITEM = "https://sidomuncul.s3.ap-southeast-3.amazonaws.com/image/item/";

  static const customerType = "${baseUrl}customer_type";
  static const customerTypeFilter = "$customerType/filter";
}
