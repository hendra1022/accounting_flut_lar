import 'package:intl/intl.dart';

extension StringExtension on String {
  String get currency => NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(double.parse(this));

  String get currencyInt => NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0).format(int.parse(this));

  String get formatedNewLine {
    return replaceAll("\\n", "\n");
  }

  String get formatPhoneNumberToZero {
    return replaceFirst("+62", "0").replaceFirst("62", "0");
  }

  String get formatPhoneNumberTo62 {
    return replaceFirst("0", "+62");
  }

  String get formatPhoneToEmpty {
    return replaceFirst("+62", "").replaceFirst("62", "").replaceFirst("0", "");
  }

  String get addPhone62 {
    return "62$this";
  }
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
    return NumberFormat('#,###').format(int.parse(this));
  }
}

extension StringCapitalizeExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
