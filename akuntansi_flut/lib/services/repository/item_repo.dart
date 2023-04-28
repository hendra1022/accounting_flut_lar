import 'package:akuntansi_flut/commons/base_response.dart';
import 'package:akuntansi_flut/services/model/item.dart';
import 'package:akuntansi_flut/services/model/request/item.dart';

import '../api_client.dart';
import '../api_url.dart';
import '../model/response/item_list.dart';

class ItemRepo extends ApiClient {
  ItemRepo._privateConstructor();

  static final ItemRepo instance = ItemRepo._privateConstructor();

  factory ItemRepo() {
    return instance;
  }

  Future<String> createData(ItemRequest request) async {
    var res = await post(
      url: ApiUrl.item,
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

  Future<String> updateData(int id, ItemRequest request) async {
    var res = await put(
      url: "${ApiUrl.item}/$id",
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
      url: "${ApiUrl.item}/$id",
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

  Future<BaseResponse<ItemListResponse>> getAllDataBy(int page, {int rowPerPage = 25, String search = "", String active = "1", int itemCatId = 0}) async {
    var res = await get(
      url: ApiUrl.itemFilter,
      params: {
        "page": "$page",
        "row_per_page": "$rowPerPage",
        "search": search,
        "is_active": active,
        "item_cat_id": "$itemCatId",
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => ItemListResponse.fromJson(data));
  }

  Future<BaseResponse<Item>> getDataById(int id) async {
    var res = await get(
      url: "${ApiUrl.item}/$id",
      headers: {
        'Content-Type': 'application/json',
      },
    );
    var json = responseHandler(res);
    return BaseResponse.fromJsonMap(json, (data) => Item.fromJson(data));
  }
}
