import 'package:intl/intl.dart';

extension StringExtension on String {
  String get currency => NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(double.parse(this));

  String get currencyInt => NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(int.parse(this));
}

extension DoublePrecision on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension StringSequence on String {
  String get sequence {
    if (this == "1") {
      return "${this}st";
    } else if (this == "2") {
      return "${this}nd";
    } else if (this == "3") {
      return "${this}rd";
    } else {
      return "${this}th";
    }
  }
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
}

extension StringCapitalizeExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
