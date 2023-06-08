class SalesHeaderLine {
  int? id;
  int? lineNo;
  int? shId;
  int? iId;
  int? qty;
  int? unitPrice;
  int? netAmount;
  String? note;
  String? createdAt;
  String? updatedAt;
  String? iName;

  SalesHeaderLine({this.id, this.lineNo, this.shId, this.iId, this.qty, this.unitPrice, this.netAmount, this.note, this.createdAt, this.updatedAt, this.iName});

  SalesHeaderLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lineNo = json['line_no'];
    shId = json['sh_id'];
    iId = json['i_id'];
    qty = json['qty'];
    unitPrice = json['unit_price'];
    netAmount = json['net_amount'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iName = json['i_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['line_no'] = lineNo;
    data['sh_id'] = shId;
    data['i_id'] = iId;
    data['qty'] = qty;
    data['unit_price'] = unitPrice;
    data['net_amount'] = netAmount;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['i_name'] = iName;
    return data;
  }
}
