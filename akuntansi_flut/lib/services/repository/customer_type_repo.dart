import 'package:akuntansi_flut/commons/base_response.dart';
import 'package:akuntansi_flut/services/model/customer_type.dart';
import 'package:akuntansi_flut/services/model/request/customer_type.dart';

import '../api_client.dart';
import '../api_url.dart';
import '../model/response/customer_type_list.dart';

class CustomerTypeRepo extends ApiClient {
  CustomerTypeRepo._privateConstructor();

  static final CustomerTypeRepo instance = CustomerTypeRepo._privateConstructor();

  factory CustomerTypeRepo() {
    return instance;
  }

  Future<String> createData(CustomerTypeRequest request) async {
    var res = await post(
      url: ApiUrl.customerType,
      body: request.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (res!.statusCode == 500) {
      return "Nama ada yang sama";
    } else if (res.statusCode == 200) {
      return "Success";
    } else {
      return "Something Wrong, ${res.statusCode}";
    }
  }

  Future<String> updateData(int id, CustomerTypeRequest request) async {
    var res = await put(
      url: "${ApiUrl.customerType}/$id",
      body: request.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (res!.statusCode == 500) {
      return "Nama ada yang sama";
    } else if (res.statusCode == 200) {
      return "Success";
    } else {
      return "Something Wrong, ${res.statusCode}";
    }
  }

  Future<String> deleteData(int id) async {
    var res = await delete(
      url: "${ApiUrl.customerType}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (res!.statusCode == 200) {
      return "Success";
    } else {
      return "Something Wrong, ${res.statusCode}";
    }
  }

  Future<BaseResponse<CustomerTypeListResponse>> getAllDataBy(int page, {int rowPerPage = 25, String search = "", String active = "1"}) async {
    var res = await get(
      url: ApiUrl.customerTypeFilter,
      params: {
        "page": "$page",
        "row_per_page": "$rowPerPage",
        "search": search,
        "is_active": active,
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => CustomerTypeListResponse.fromJson(data));
  }

  Future<BaseResponse<CustomerType>> getDataById(int id) async {
    var res = await get(
      url: "${ApiUrl.customerType}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => CustomerType.fromJson(data));
  }
}
