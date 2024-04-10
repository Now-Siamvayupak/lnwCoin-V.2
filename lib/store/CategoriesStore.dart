import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_sorting_model.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

part 'CategoriesStore.g.dart';

class CategoriesStore = CategoriesStoreBase with _$CategoriesStore;

abstract class CategoriesStoreBase with Store {
  @observable
  SortingTypeModel? selectedSortType;

  @observable
  SortingTypeModel? selectedIntervalType;

  @action
  Future setSelectedSortType(int value) async {
    selectedSortType = getSelectedCategoriesSortingType(defaultOrder: getIntAsync(SharedPreferenceKeys.SORTING_CATEGORIES_SELECTED_INDEX, defaultValue: value));
    selectedCategorySortingType = getSelectedCategoriesSortingType(defaultOrder: getIntAsync(SharedPreferenceKeys.SORTING_CATEGORIES_SELECTED_INDEX, defaultValue: value));
  }
}
