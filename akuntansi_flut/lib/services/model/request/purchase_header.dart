class PurchaseHeaderRequest {
  String? purchaseDate;
  String? sId;
  String? grossAmount;
  String? netAmount;
  String? note;

  PurchaseHeaderRequest({this.purchaseDate, this.sId, this.grossAmount, this.netAmount, this.note});

  PurchaseHeaderRequest.fromJson(Map<String, dynamic> json) {
    purchaseDate = json['purchase_date'];
    sId = json['s_id'];
    grossAmount = json['gross_amount'];
    netAmount = json['net_amount'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['purchase_date'] = purchaseDate;
    data['s_id'] = sId;
    data['gross_amount'] = grossAmount;
    data['net_amount'] = netAmount;
    data['note'] = note;
    return data;
  }
}
