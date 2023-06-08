import 'package:akuntansi_flut/services/model/request/sales_header.dart';
import 'package:akuntansi_flut/services/model/response/sales_header_list.dart';
import 'package:akuntansi_flut/services/model/sales_header.dart';

import '../../commons/base_response.dart';
import '../api_client.dart';
import '../api_url.dart';
import '../model/response/sales_header_line_list.dart';

class SalesRepo extends ApiClient {
  SalesRepo._privateConstructor();

  static final SalesRepo instance = SalesRepo._privateConstructor();

  factory SalesRepo() {
    return instance;
  }

  Future<String> createData(SalesHeaderRequest request) async {
    var res = await post(
      url: ApiUrl.salesHeaderCombo,
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
      url: "${ApiUrl.salesHeader}/$id",
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

  Future<BaseResponse<SalesHeaderListResponse>> getAllDataBy(
    int page,
    String startDate,
    String endDate, {
    int rowPerPage = 25,
  }) async {
    var res = await get(
      url: ApiUrl.salesHeaderFilter,
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
    return BaseResponse.fromJsonMap(json, (data) => SalesHeaderListResponse.fromJson(data));
  }

  Future<BaseResponse<SalesHeader>> getDataById(int id) async {
    var res = await get(
      url: "${ApiUrl.salesHeader}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => SalesHeader.fromJson(data));
  }

  Future<BaseResponse<SalesHeader>> getHeaderLine(int id) async {
    var res = await get(
      url: "${ApiUrl.salesHeaderLine}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => SalesHeader.fromJson(data));
  }

  Future<BaseResponse<SalesHeaderLineListResponse>> getAllDataLine(int page, int shId, {int rowPerPage = 25}) async {
    var res = await get(
      url: ApiUrl.salesHeaderLineFilter,
      params: {
        "page": "$page",
        "row_per_page": "$rowPerPage",
        "header_id": shId.toString(),
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => SalesHeaderLineListResponse.fromJson(data));
  }
}
