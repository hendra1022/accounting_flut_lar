class CustomerRequest {
  String? name;
  String? address;
  String? email;
  String? phone;
  String? description;
  String? active;
  String? ctId;

  CustomerRequest({this.name, this.address, this.email, this.phone, this.description, this.active, this.ctId});

  CustomerRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    description = json['description'];
    active = json['active'];
    ctId = json['ct_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['email'] = email;
    data['phone'] = phone;
    data['description'] = description;
    data['active'] = active;
    data['ct_id'] = ctId;
    return data;
  }
}
