class CustomerType {
  int? id;
  String? name;
  String? active;
  String? createdAt;
  String? updatedAt;

  CustomerType({this.id, this.name, this.active, this.createdAt, this.updatedAt});

  CustomerType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
