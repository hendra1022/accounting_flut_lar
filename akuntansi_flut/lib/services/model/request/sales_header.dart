import 'sales_header_line.dart';

class SalesHeaderRequest {
  String? transactionDate;
  String? cId;
  String? grossAmount;
  String? netAmount;
  String? note;
  List<SalesLineRequest>? salesHeaderList;

  SalesHeaderRequest({this.transactionDate, this.cId, this.grossAmount, this.netAmount, this.note, this.salesHeaderList});

  SalesHeaderRequest.fromJson(Map<String, dynamic> json) {
    transactionDate = json['transaction_date'];
    cId = json['c_id'];
    grossAmount = json['gross_amount'];
    netAmount = json['net_amount'];
    note = json['note'];
    if (json['data'] != null) {
      salesHeaderList = <SalesLineRequest>[];
      json['data'].forEach((v) {
        salesHeaderList!.add(SalesLineRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_date'] = transactionDate;
    data['c_id'] = cId;
    data['gross_amount'] = grossAmount;
    data['net_amount'] = netAmount;
    data['note'] = note;
    if (salesHeaderList != null) {
      data['data'] = salesHeaderList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
