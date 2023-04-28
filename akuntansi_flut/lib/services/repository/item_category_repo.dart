import 'package:akuntansi_flut/commons/base_response.dart';
import 'package:akuntansi_flut/services/model/item_category.dart';
import 'package:akuntansi_flut/services/model/request/item_category.dart';
import 'package:akuntansi_flut/services/model/response/item_category_list.dart';

import '../api_client.dart';
import '../api_url.dart';

class ItemCategoryRepo extends ApiClient {
  ItemCategoryRepo._privateConstructor();

  static final ItemCategoryRepo instance = ItemCategoryRepo._privateConstructor();

  factory ItemCategoryRepo() {
    return instance;
  }

  Future<String> createData(ItemCategoryRequest request) async {
    var res = await post(
      url: ApiUrl.itemCategory,
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

  Future<String> updateData(int id, ItemCategoryRequest request) async {
    var res = await put(
      url: "${ApiUrl.itemCategory}/$id",
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
      url: "${ApiUrl.itemCategory}/$id",
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

  Future<BaseResponse<ItemCategoryListResponse>> getAllDataBy(int page, {int rowPerPage = 25, String search = "", String active = "1"}) async {
    var res = await get(
      url: ApiUrl.itemCategoryFilter,
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
    return BaseResponse.fromJsonMap(json, (data) => ItemCategoryListResponse.fromJson(data));
  }

  Future<BaseResponse<ItemCategoryListResponse>> getAllData() async {
    var res = await get(
      url: ApiUrl.itemCategory,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => ItemCategoryListResponse.fromJson(data));
  }

  Future<BaseResponse<ItemCategory>> getDataById(int id) async {
    var res = await get(
      url: "${ApiUrl.itemCategory}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => ItemCategory.fromJson(data));
  }
}
