class Customer {
  int? id;
  String? name;
  String? address;
  String? email;
  String? emailVerifiedAt;
  String? phone;
  String? active;
  String? description;
  int? ctId;
  String? createdAt;
  String? updatedAt;

  Customer(
      {this.id,
      this.name,
      this.address,
      this.email,
      this.emailVerifiedAt,
      this.phone,
      this.active,
      this.description,
      this.ctId,
      this.createdAt,
      this.updatedAt});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    active = json['active'];
    description = json['description'];
    ctId = json['ct_id'];
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
    data['ct_id'] = ctId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
