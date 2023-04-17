import 'package:akuntansi_flut/commons/base_response.dart';
import 'package:akuntansi_flut/services/model/request/customer_type.dart';

import '../api_client.dart';
import '../api_url.dart';
import '../model/response/customer_type_list_response.dart';

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

  Future<BaseResponse<CustomerTypeListResponse>> getAllData(int page, {int rowPerPage = 25, String search = "", String active = "1"}) async {
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

  // Future<BaseResponse<CheckIn>> checkIn({required CheckInRequestBody body}) async {
  //   var res = await post(
  //     url: ApiUrl.CHECK_IN_ADD,
  //     body: body.toJson(),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer ${UserStore.to.userAccount.token}',
  //     },
  //   );
  // var json = responseHandler(res);
  //   return BaseResponse.fromJsonMap(json, (data) => CheckIn.fromJson(data));
  // }

  // Future<bool> getCheckIn() async {
  //   try {
  //     var response = await CustomerTypeRepo().getCheckInResponse();
  //     if (response.code == 200) {
  //       if (response.data!.userCheckinActivity!.id != null) {
  //         return true;
  //       }
  //     }
  //   } catch (_) {}
  //   return false;
  // }

  // Future<String> doCheckIn() async {
  //   try {
  //     var response = await CustomerTypeRepo().checkIn(body: CheckInRequestBody(userId: UserStore.to.userAccount.userId));
  //     // log("response : ${response.data!.toJson()}");
  //     if (response.code == 200) {
  //       return "success";
  //     } else {
  //       return "failed : ${response.message}";
  //     }
  //   } catch (_) {
  //     return "failure";
  //   }
  // }
}
