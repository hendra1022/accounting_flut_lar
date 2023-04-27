class Supplier {
  int? id;
  String? name;
  String? address;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? active;
  String? description;
  String? createdAt;
  String? updatedAt;

  Supplier({this.id, this.name, this.address, this.email, this.emailVerifiedAt, this.phone, this.active, this.description, this.createdAt, this.updatedAt});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    active = json['active'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone'] = phone;
    data['active'] = active;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
