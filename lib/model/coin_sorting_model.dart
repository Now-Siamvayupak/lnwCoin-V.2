import 'package:lnwcoin/utils/app_constant.dart';
import 'package:nb_utils/nb_utils.dart';

class SortingTypeModel {
  int? id;
  String? name;
  String? value;

  SortingTypeModel({this.id, this.name, this.value});

  static List<SortingTypeModel> get getSortingTypeList {
    List<SortingTypeModel> data = [];

    data.add(SortingTypeModel(id: 0, name: "Highest Ranking", value: "gecko_desc"));
    data.add(SortingTypeModel(id: 1, name: "Lowest Ranking", value: "gecko_asc"));
    data.add(SortingTypeModel(id: 2, name: "Largest Market Cap", value: "market_cap_desc"));
    data.add(SortingTypeModel(id: 3, name: "Smallest Market Cap", value: "market_cap_asc"));
    data.add(SortingTypeModel(id: 4, name: "Highest Price", value: "volume_desc"));
    data.add(SortingTypeModel(id: 5, name: "Lowest Price", value: "volume_asc"));
    data.add(SortingTypeModel(id: 6, name: "Largest Positive price % change", value: "id_desc"));
    data.add(SortingTypeModel(id: 7, name: "Largest Negative price % change", value: "id_asc"));
    return data;
  }

  static List<SortingTypeModel> get getCategorySortingTypeList {
    List<SortingTypeModel> data = [];
    data.add(SortingTypeModel(id: 0, name: "Largest Market Cap(Default)", value: "market_cap_desc"));
    data.add(SortingTypeModel(id: 1, name: "Smallest Market Cap", value: "market_cap_asc"));
    data.add(SortingTypeModel(id: 2, name: "Name Descending", value: "name_desc"));
    data.add(SortingTypeModel(id: 3, name: "Name Ascending", value: "name_asc"));
    data.add(SortingTypeModel(id: 4, name: "Largest 24h Market Cap", value: "market_cap_change_24h_desc"));
    data.add(SortingTypeModel(id: 5, name: "Smallest 24h Market Cap", value: "market_cap_change_24h_asc"));

    return data;
  }

  static List<SortingTypeModel> get getSortingIntervalList {
    List<SortingTypeModel> data = [];

    data.add(SortingTypeModel(id: 0, name: "1h", value: "1h"));
    data.add(SortingTypeModel(id: 1, name: "24h", value: "24h"));
    data.add(SortingTypeModel(id: 2, name: "7d", value: "7d"));
    data.add(SortingTypeModel(id: 3, name: "14d", value: "14d"));
    data.add(SortingTypeModel(id: 4, name: "30d", value: "30d"));
    data.add(SortingTypeModel(id: 5, name: "200d", value: "200d"));
    data.add(SortingTypeModel(id: 6, name: "1y", value: "1y"));
    return data;
  }

  static List<SortingTypeModel> get getExchangesSortValue {
    List<SortingTypeModel> data = [];

    data.add(SortingTypeModel(id: 0, name: "BTC", value: "btc"));
    data.add(SortingTypeModel(id: 1, name: "ETH", value: "eth"));
    data.add(SortingTypeModel(id: 2, name: "USD", value: "usd"));

    return data;
  }
}

SortingTypeModel? getSelectedSortingType({int defaultOrder = 3}) {
  SortingTypeModel? data;

  SortingTypeModel.getSortingTypeList.forEach((element) {
    if (element.id == getIntAsync(SharedPreferenceKeys.SORTING_ORDER_SELECTED_INDEX, defaultValue: defaultOrder)) {
      data = element;
    }
  });

  return data;
}

SortingTypeModel? getSelectedCategoriesSortingType({int defaultOrder = 0}) {
  SortingTypeModel? data;

  SortingTypeModel.getCategorySortingTypeList.forEach((element) {
    if (element.id == getIntAsync(SharedPreferenceKeys.SORTING_CATEGORIES_SELECTED_INDEX, defaultValue: defaultOrder)) {
      data = element;
    }
  });

  return data;
}

SortingTypeModel? getSelectedSortingIntervalType({int defaultInterval = 0}) {
  SortingTypeModel? data;

  SortingTypeModel.getSortingIntervalList.forEach((element) {
    if (element.id == getIntAsync(SharedPreferenceKeys.DEFAULT_INTERVAL_SELECTED_INDEX, defaultValue: defaultInterval)) {
      data = element;
    }
  });

  return data;
}
