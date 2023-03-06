import 'package:akuntansi_flut/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static Future<DateTime> vShowDatePicker({DateTime? selectedDate}) async {
    var data = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    return data ?? DateTime.now();
  }

  static String getFormatedStringTime(DateTime dateTime) {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(dateTime);
  }

  static String getRoundedAmount(String? amount) {
    amount ??= "0";
    int amtValue = double.parse(amount).round();
    return amtValue.toString().currency;
  }

  static String getRoundedQty(String? qty) {
    qty ??= "0";
    int qtyValue = double.parse(qty).round();
    return qtyValue.toString();
  }

  static String formatDate(String? date) {
    if (date == null || date != " ") {
      return "No Date";
    } else {
      try {
        var dateFormated = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(date);
        return DateFormat("dd MMM yyyy").format(dateFormated);
      } catch (_) {
        var dateFormated = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
        return DateFormat("dd MMM yyyy").format(dateFormated);
      }
    }
  }
}
