import 'dart:convert';

import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/model/coin_list_model.dart';
import 'package:lnwcoin/model/coin_sorting_model.dart';
import 'package:lnwcoin/model/currency_model.dart';
import 'package:lnwcoin/model/derivatives_detail_model.dart' as d;
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:nb_utils/nb_utils.dart';

num? getPercentageValueInCurrency(PriceChange24hInCurrency percentage1hInCurrency) {
  CurrencyModel selectedCurrency = CurrencyModel.fromJson(jsonDecode(getStringAsync(SharedPreferenceKeys.SELECTED_CURRENCY)));
  Map<String, dynamic> json = percentage1hInCurrency.toJson();

  if (json.keys.toList().any((element) => selectedCurrency.cc == element)) {
    return json.values.toList()[json.keys.toList().indexOf(selectedCurrency.cc.toString())];
  }
  return 0;
}

String? getDates(AthDate dates) {
  CurrencyModel selectedCurrency = CurrencyModel.fromJson(jsonDecode(getStringAsync(SharedPreferenceKeys.SELECTED_CURRENCY)));
  Map<String, dynamic> json = dates.toJson();

  if (json.keys.toList().any((element) => selectedCurrency.cc == element)) {
    return json.values.toList()[json.keys.toList().indexOf(selectedCurrency.cc.toString())];
  }

  return "";
}

num? getExchangeFrom(SortingTypeModel type, ConvertedLast data) {
  Map<String, dynamic> json = data.toJson();
  if (json.keys.toList().any((element) => type.value == element)) {
    return json.values.toList()[json.keys.toList().indexOf(type.value.toString())];
  }
  return 0;
}

num? getExchangeFromDerivatives(SortingTypeModel type, d.ConvertedLast data) {
  Map<String, dynamic> json = data.toJson();
  if (json.keys.toList().any((element) => type.value == element)) {
    return json.values.toList()[json.keys.toList().indexOf(type.value.toString())].toString().toDouble();
  }
  return 0;
}

String getCurrencyPrefix(int? selectedValue) {
  if (selectedValue == 0) {
    return '₿';
  } else if (selectedValue == 1) {
    return 'Ξ';
  } else if (selectedValue == 2) {
    return '\$';
  } else {
    return '';
  }
}

num getInterval(CoinListModel coinListModel, SortingTypeModel sortingType) {
  num value = 1.0;

  if (sortingType.value.validate() == "1h") {
    value = coinListModel.price_change_percentage_1h_in_currency.validate();
  } else if (sortingType.value.validate() == "24h") {
    value = coinListModel.price_change_percentage_24h_in_currency.validate();
  } else if (sortingType.value.validate() == "7d") {
    value = coinListModel.price_change_percentage_7d_in_currency.validate();
  } else if (sortingType.value.validate() == "14d") {
    value = coinListModel.price_change_percentage_14d_in_currency.validate();
  } else if (sortingType.value.validate() == "30d") {
    value = coinListModel.price_change_percentage_30d_in_currency.validate();
  } else if (sortingType.value.validate() == "200d") {
    value = coinListModel.price_change_percentage_200d_in_currency.validate();
  } else if (sortingType.value.validate() == "1y") {
    value = coinListModel.price_change_percentage_1y_in_currency.validate();
  } else {
    value = coinListModel.price_change_percentage_1h_in_currency.validate();
  }
  return value;
}
