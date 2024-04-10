import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_sorting_model.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

part 'CoinStore.g.dart';

class CoinStore = CoinStoreBase with _$CoinStore;

abstract class CoinStoreBase with Store {
  @observable
  SortingTypeModel? selectedSortType;

  @observable
  SortingTypeModel? selectedIntervalType;

  @action
  Future setSelectedSortType(int value) async {
    selectedSortType = getSelectedSortingType(defaultOrder: getIntAsync(SharedPreferenceKeys.SORTING_ORDER_SELECTED_INDEX, defaultValue: value));
    selectedSortingType = getSelectedSortingType(defaultOrder: getIntAsync(SharedPreferenceKeys.SORTING_ORDER_SELECTED_INDEX, defaultValue: value));
  }

  @action
  Future setSelectedIntervalType(int value) async {
    selectedIntervalType = getSelectedSortingIntervalType(defaultInterval: getIntAsync(SharedPreferenceKeys.DEFAULT_INTERVAL_SELECTED_INDEX, defaultValue: value));
    selectedIntervalTypes = getSelectedSortingIntervalType(defaultInterval: getIntAsync(SharedPreferenceKeys.DEFAULT_INTERVAL_SELECTED_INDEX, defaultValue: value));
  }
}
