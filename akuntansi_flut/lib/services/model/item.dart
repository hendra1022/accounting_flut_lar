class Item {
  int? id;
  String? name;
  String? emailVerifiedAt;
  String? active;
  String? haveChild;
  int? parentId;
  int? icId;
  String? icName;
  String? createdAt;
  String? updatedAt;

  Item({this.id, this.name, this.emailVerifiedAt, this.active, this.haveChild, this.parentId, this.icId, this.icName, this.createdAt, this.updatedAt});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    emailVerifiedAt = json['email_verified_at'];
    active = json['active'];
    haveChild = json['have_child'];
    parentId = json['parent_id'];
    icId = json['ic_id'];
    icName = json['ic_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email_verified_at'] = emailVerifiedAt;
    data['active'] = active;
    data['have_child'] = haveChild;
    data['parent_id'] = parentId;
    data['ic_id'] = icId;
    data['ic_name'] = icName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
