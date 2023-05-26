class PurchaseHeaderLineRequestBody {
  String? purchaseDate;
  String? sId;
  String? grossAmount;
  String? netAmount;
  String? note;
  List<PurchaseLineRequestBody>? data;

  PurchaseHeaderLineRequestBody({this.purchaseDate, this.sId, this.grossAmount, this.netAmount, this.note, this.data});

  PurchaseHeaderLineRequestBody.fromJson(Map<String, dynamic> json) {
    purchaseDate = json['purchase_date'];
    sId = json['s_id'];
    grossAmount = json['gross_amount'];
    netAmount = json['net_amount'];
    note = json['note'];
    if (json['data'] != null) {
      data = <PurchaseLineRequestBody>[];
      json['data'].forEach((v) {
        data!.add(PurchaseLineRequestBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['purchase_date'] = purchaseDate;
    data['s_id'] = sId;
    data['gross_amount'] = grossAmount;
    data['net_amount'] = netAmount;
    data['note'] = note;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PurchaseLineRequestBody {
  String? lineNo;
  String? iId;
  String? qty;
  String? unitPrice;
  String? netAmount;
  String? note;
  String? itemName;

  PurchaseLineRequestBody({
    this.lineNo,
    this.iId,
    this.qty,
    this.unitPrice,
    this.netAmount,
    this.note,
    this.itemName,
  });

  PurchaseLineRequestBody.fromJson(Map<String, dynamic> json) {
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
