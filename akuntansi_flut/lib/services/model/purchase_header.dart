class PurchaseHeader {
  int? id;
  String? transactionDate;
  int? sId;
  int? grossAmount;
  int? netAmount;
  String? note;
  String? createdAt;
  String? updatedAt;
  String? sName;

  PurchaseHeader({this.id, this.transactionDate, this.sId, this.grossAmount, this.netAmount, this.note, this.createdAt, this.updatedAt, this.sName});

  PurchaseHeader.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionDate = json['transaction_date'];
    sId = json['s_id'];
    grossAmount = json['gross_amount'];
    netAmount = json['net_amount'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sName = json['s_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_date'] = transactionDate;
    data['s_id'] = sId;
    data['gross_amount'] = grossAmount;
    data['net_amount'] = netAmount;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['s_name'] = sName;
    return data;
  }
}
