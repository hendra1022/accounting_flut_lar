import 'package:intl/intl.dart';

extension StringExtension on String {
  String get currency => NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(double.parse(this));

  String get currencyInt => NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(int.parse(this));

  String get dateDatabaseToView => DateFormat("dd-MM-yyyy").format(DateFormat("yyyy-MM-dd").parse(this));
}

extension DoublePrecision on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension StringCurrency on String {
  String get toCurrency {
    return 'Rp. ${this},-';
  }
}

extension StringNumberFormat on String {
  String get thousandSeparator {
    try {
      return NumberFormat('#,###').format(int.parse(this));
    } catch (_) {
      return NumberFormat('#,###').format(double.parse(this));
    }
  }

  double convertToDouble() {
    try {
      return double.tryParse(this)!.toPrecision(2);
    } catch (e) {
      return int.tryParse(this)!.toDouble().toPrecision(2);
    }
  }

  int convertToInt() {
    try {
      return int.tryParse(this)!;
    } catch (e) {
      return double.tryParse(this)!.round();
    }
  }
}

extension StringCapitalizeExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension StringExpresionExtension on String {
  bool isOnlyContainNumber() {
    if (this != "") {
      return false;
    }
    try {
      double.tryParse(this);
      return true;
    } catch (e) {
      try {
        int.tryParse(this);
        return true;
      } catch (e) {
        return false;
      }
    }
  }
}
