import 'package:intl/intl.dart';

import '../enum/category_type.dart';

class MoneyModel {
  String? id;
  String label;
  double money;
  CategoryType categoryType;
  String dateTime;

  MoneyModel({
    this.id,
    required this.label,
    required this.money,
    required this.categoryType,
    required this.dateTime,
  });

  MoneyModel copyWith({
    String? newId,
    String? newLabel,
    double? newMoney,
    CategoryType? newCategoryType,
    String? newDateTime,
  }) {
    return MoneyModel(
      id: newId ?? id,
      label: newLabel ?? label,
      money: newMoney ?? money,
      categoryType: newCategoryType ?? categoryType,
      dateTime: newDateTime ?? dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "label": label,
      "money": money,
      "categoryType": categoryType,
      "dateTime": dateTime,
    };
  }

  factory MoneyModel.fromJson(Map json) {
    return MoneyModel(
      id: json["id"],
      label: json["label"],
      money: json["money"],
      categoryType: json["categoryType"],
      dateTime: json["dateTime"],
    );
  }
}

String getMonthString(int month) {
  switch (month) {
    case 1:
      return "Januari";
    case 2:
      return "Februari";
    case 3:
      return "Maret";
    case 4:
      return "April";
    case 5:
      return "Mei";
    case 6:
      return "Juni";
    case 7:
      return "Juli";
    case 8:
      return "Agustus";
    case 9:
      return "September";
    case 10:
      return "Oktober";
    case 11:
      return "November";
    case 12:
      return "Desember";
    default:
      return "Unknown";
  }
}

String getDateTimeString(String date) {
  final dateArray = date.split("-");

  final month = int.parse(dateArray[0]);
  final year = int.parse(dateArray[1]);

  return "${getMonthString(month)} $year";
}

String getMoneyFormatted(double money) {
  return NumberFormat.compactCurrency(
    decimalDigits: 2,
    symbol: "",
  ).format(money);
}
