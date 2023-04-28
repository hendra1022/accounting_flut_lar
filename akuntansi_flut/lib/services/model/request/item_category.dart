class ItemCategoryRequest {
  String? name;
  String? active;

  ItemCategoryRequest({this.name, this.active});

  ItemCategoryRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['active'] = active;
    return data;
  }
}
