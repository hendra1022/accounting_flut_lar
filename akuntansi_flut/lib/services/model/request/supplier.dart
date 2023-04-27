class SupplierRequest {
  String? name;
  String? address;
  String? email;
  String? phone;
  String? description;
  String? active;

  SupplierRequest({this.name, this.address, this.email, this.phone, this.description, this.active});

  SupplierRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    description = json['description'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['email'] = email;
    data['phone'] = phone;
    data['description'] = description;
    data['active'] = active;
    return data;
  }
}
