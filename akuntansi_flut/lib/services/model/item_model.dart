class ItemModel {
  String? id;
  String? code;
  String? name;
  String? categoryId;
  String? categoryName;
  String? active;
  String? minPrice;
  String? price;
  String? createdDate;
  String? updatedDate;

  ItemModel({this.id, this.code, this.name, this.categoryId, this.categoryName, this.active, this.minPrice, this.price, this.createdDate, this.updatedDate});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    active = json['active'];
    minPrice = json['min_price'];
    price = json['price'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['active'] = active;
    data['min_price'] = minPrice;
    data['price'] = price;
    data['created_date'] = createdDate;
    data['updated_date'] = updatedDate;
    return data;
  }
}
