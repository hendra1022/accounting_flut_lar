import 'package:akuntansi_flut/commons/base_response.dart';
import 'package:akuntansi_flut/services/model/purchase_header.dart';
import 'package:akuntansi_flut/services/model/request/purchase_header.dart';
import 'package:akuntansi_flut/services/model/response/purchase_header_line_list.dart';

import '../api_client.dart';
import '../api_url.dart';
import '../model/response/purchase_header_list.dart';

class PurchaseRepo extends ApiClient {
  PurchaseRepo._privateConstructor();

  static final PurchaseRepo instance = PurchaseRepo._privateConstructor();

  factory PurchaseRepo() {
    return instance;
  }

  Future<String> createData(PurchaseHeaderRequest request) async {
    var res = await post(
      url: ApiUrl.purchaseHeader,
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

  Future<String> createDataCombo(PurchaseHeaderRequest request) async {
    var res = await post(
      url: ApiUrl.purchaseHeaderCombo,
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

  Future<String> updateData(int id, PurchaseHeaderRequest request) async {
    var res = await put(
      url: "${ApiUrl.purchaseHeader}/$id",
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
      url: "${ApiUrl.purchaseHeader}/$id",
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

  Future<BaseResponse<PurchaseHeaderListResponse>> getAllDataBy(
    int page,
    String startDate,
    String endDate, {
    int rowPerPage = 25,
  }) async {
    var res = await get(
      url: ApiUrl.purchaseHeaderFilter,
      params: {
        "page": "$page",
        "row_per_page": "$rowPerPage",
        "start_date": startDate,
        "end_date": endDate,
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => PurchaseHeaderListResponse.fromJson(data));
  }

  Future<BaseResponse<PurchaseHeader>> getDataById(int id) async {
    var res = await get(
      url: "${ApiUrl.purchaseHeader}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => PurchaseHeader.fromJson(data));
  }

  Future<BaseResponse<PurchaseHeader>> getPurchaseHeaderLine(int id) async {
    var res = await get(
      url: "${ApiUrl.purchaseHeaderLine}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => PurchaseHeader.fromJson(data));
  }

  Future<BaseResponse<PurchaseHeaderLineListResponse>> getAllDataLine(int page, int phId, {int rowPerPage = 25}) async {
    var res = await get(
      url: ApiUrl.purchaseHeaderLineFilter,
      params: {
        "page": "$page",
        "row_per_page": "$rowPerPage",
        "header_id": phId.toString(),
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => PurchaseHeaderLineListResponse.fromJson(data));
  }
}
