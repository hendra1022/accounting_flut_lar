class ItemModel {
  String? id;
  String? name;
  String? categoryId;
  String? harga;

  ItemModel({this.id, this.name, this.categoryId, this.harga});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['category_id'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category_id'] = categoryId;
    data['harga'] = harga;
    return data;
  }
}
