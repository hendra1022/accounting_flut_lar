import 'package:akuntansi_flut/commons/base_response.dart';
import 'package:akuntansi_flut/services/model/request/supplier.dart';
import 'package:akuntansi_flut/services/model/response/supplier_list.dart';
import 'package:akuntansi_flut/services/model/supplier.dart';

import '../api_client.dart';
import '../api_url.dart';

class SupplierRepo extends ApiClient {
  SupplierRepo._privateConstructor();

  static final SupplierRepo instance = SupplierRepo._privateConstructor();

  factory SupplierRepo() {
    return instance;
  }

  Future<String> createData(SupplierRequest request) async {
    var res = await post(
      url: ApiUrl.supplier,
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

  Future<String> updateData(int id, SupplierRequest request) async {
    var res = await put(
      url: "${ApiUrl.supplier}/$id",
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
      url: "${ApiUrl.supplier}/$id",
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

  Future<BaseResponse<SupplierListResponse>> getAllDataBy(int page, {int rowPerPage = 25, String search = "", String active = "1"}) async {
    var res = await get(
      url: ApiUrl.supplierFilter,
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
    return BaseResponse.fromJsonMap(json, (data) => SupplierListResponse.fromJson(data));
  }

  Future<BaseResponse<Supplier>> getDataById(int id) async {
    var res = await get(
      url: "${ApiUrl.supplier}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => Supplier.fromJson(data));
  }
}
