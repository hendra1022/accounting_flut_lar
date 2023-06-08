class SalesLineRequest {
  String? lineNo;
  String? iId;
  String? qty;
  String? unitPrice;
  String? netAmount;
  String? note;
  String? itemName;

  SalesLineRequest({this.lineNo, this.iId, this.qty, this.unitPrice, this.netAmount, this.note, this.itemName});

  SalesLineRequest.fromJson(Map<String, dynamic> json) {
    lineNo = json['line_no'];
    iId = json['i_id'];
    qty = json['qty'];
    unitPrice = json['unit_price'];
    netAmount = json['net_amount'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['line_no'] = lineNo;
    data['i_id'] = iId;
    data['qty'] = qty;
    data['unit_price'] = unitPrice;
    data['net_amount'] = netAmount;
    data['note'] = note;
    return data;
  }
}
