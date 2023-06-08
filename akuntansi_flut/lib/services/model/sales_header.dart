class SalesHeader {
  int? id;
  String? transactionDate;
  int? cId;
  int? grossAmount;
  int? netAmount;
  String? note;
  String? createdAt;
  String? updatedAt;
  String? cName;

  SalesHeader({this.id, this.transactionDate, this.cId, this.grossAmount, this.netAmount, this.note, this.createdAt, this.updatedAt, this.cName});

  SalesHeader.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionDate = json['transaction_date'];
    cId = json['c_id'];
    grossAmount = json['gross_amount'];
    netAmount = json['net_amount'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cName = json['c_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_date'] = transactionDate;
    data['c_id'] = cId;
    data['gross_amount'] = grossAmount;
    data['net_amount'] = netAmount;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['c_name'] = cName;
    return data;
  }
}
