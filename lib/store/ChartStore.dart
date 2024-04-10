import 'package:lnwcoin/utils/app_constant.dart';
import 'package:mobx/mobx.dart';

part 'ChartStore.g.dart';

class ChartStore = ChartStoreBase with _$ChartStore;

abstract class ChartStoreBase with Store {
  @observable
  ChartMarketType mSelectedChartMarketType = ChartMarketType.PRICES;

  @observable
  int mRangeDifference = 1;

  @observable
  int mExchangeRangeDifference = 1;

  @observable
  DateTime? mFromDate;

  @observable
  DateTime? mToDate;

  @observable
  bool? mIsDateSelected;

  @action
  Future setSelectedChartMarketType(ChartMarketType aChartMarketType) async => mSelectedChartMarketType = aChartMarketType;

  @action
  Future setFromDate(DateTime fromDate) async => mFromDate = fromDate;

  @action
  Future setToDate(DateTime toDate) async => mToDate = toDate;

  @action
  Future setIsDateSelected(bool toDateSelected) async {
    return mIsDateSelected = toDateSelected;
  }

  @action
  Future setRangeDifference(int aRangeDifference) async => mRangeDifference = aRangeDifference;

  @action
  Future setExchangeRangeDifference(int aRangeDifference) async => mExchangeRangeDifference = aRangeDifference;
}
