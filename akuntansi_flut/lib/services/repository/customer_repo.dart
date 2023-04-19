import 'package:akuntansi_flut/commons/base_response.dart';
import 'package:akuntansi_flut/services/model/customer.dart';
import 'package:akuntansi_flut/services/model/response/customer_list.dart';

import '../api_client.dart';
import '../api_url.dart';
import '../model/request/customer.dart';

class CustomerRepo extends ApiClient {
  CustomerRepo._privateConstructor();

  static final CustomerRepo instance = CustomerRepo._privateConstructor();

  factory CustomerRepo() {
    return instance;
  }

  Future<String> createData(CustomerRequest request) async {
    var res = await post(
      url: ApiUrl.customer,
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

  Future<String> updateData(int id, CustomerRequest request) async {
    var res = await put(
      url: "${ApiUrl.customer}/$id",
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
      url: "${ApiUrl.customer}/$id",
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

  Future<BaseResponse<CustomerListResponse>> getAllDataBy(int page, {int rowPerPage = 25, String search = "", String active = "1"}) async {
    var res = await get(
      url: ApiUrl.customerFilter,
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
    return BaseResponse.fromJsonMap(json, (data) => CustomerListResponse.fromJson(data));
  }

  Future<BaseResponse<Customer>> getDataById(int id) async {
    var res = await get(
      url: "${ApiUrl.customer}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => Customer.fromJson(data));
  }
}
