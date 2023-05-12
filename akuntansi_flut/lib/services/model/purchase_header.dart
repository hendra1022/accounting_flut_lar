class PurchaseHeader {
  int? id;
  String? purchaseDate;
  int? sId;
  int? grossAmount;
  int? netAmount;
  int? note;
  String? createdAt;
  String? updatedAt;

  PurchaseHeader({this.id, this.purchaseDate, this.sId, this.grossAmount, this.netAmount, this.note, this.createdAt, this.updatedAt});

  PurchaseHeader.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purchaseDate = json['purchase_date'];
    sId = json['s_id'];
    grossAmount = json['gross_amount'];
    netAmount = json['net_amount'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['purchase_date'] = purchaseDate;
    data['s_id'] = sId;
    data['gross_amount'] = grossAmount;
    data['net_amount'] = netAmount;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
