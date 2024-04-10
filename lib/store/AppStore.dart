import 'dart:convert';

import 'package:lnwcoin/model/currency_model.dart';
import 'package:lnwcoin/model/default_setting.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/app_colors.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  LanguageDataModel? selectedLanguage;

  @observable
  Color mSelectedGraphColor = AppConstant.defaultGraphColor;

  @observable
  ChartMarketType mSelectedMarketType = AppConstant.defaultChartMarketType;

  @observable
  DefaultSetting? mDashboardType;

  @observable
  DefaultSetting? mDefaultChart;

  @observable
  DefaultSetting? mDefaultTrendingCard;

  @observable
  CurrencyModel? mSelectedCurrency;

  @observable
  bool? mIsLoading;

  @observable
  bool isLoggedIn = false;

  @observable
  String uid = '';

  @observable
  String firstName = '';

  @observable
  String email = '';

  @observable
  String photoUrl = '';

  @observable
  bool isEmailLogin = false;

  @observable
  bool isTester = false;

  @observable
  bool isLoading = false;

  @observable
  bool isDarkMode = true;

  @observable
  bool isSocialLogin = false;

  @computed
  bool get isNetworkConnected => connectivityResult != ConnectivityResult.none;

  /*@observable
  List<String> favCoinList = [];*/

  @observable
  List<String> favCoinList = [];

  @observable
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  @observable
  bool useMaterialYouTheme = true;

  @action
  Future<void> setUseMaterialYouTheme(bool val, {bool isInitializing = false}) async {
    useMaterialYouTheme = val;
    if (!isInitializing) await setValue(USE_MATERIAL_YOU_THEME, val);
  }

  @action
  Future setSelectedGraphColor(Color aColor) async => mSelectedGraphColor = aColor;

  @action
  Future setSelectedMarketType(ChartMarketType aType) async => mSelectedMarketType = aType;

  @action
  Future setSelectedDashboard(DefaultSetting aType) async => mDashboardType = aType;

  @action
  Future setSelectedDefaultChart(DefaultSetting aType) async => mDefaultChart = aType;

  @action
  Future setSelectedDefaultTrendingCard(DefaultSetting aType) async => mDefaultTrendingCard = aType;

  @action
  Future setLoading(bool aIsLoading) async => mIsLoading = aIsLoading;

  @action
  Future<CurrencyModel> setSelectedCurrency(CurrencyModel aSelectedCurrency) async {
    setValue(SharedPreferenceKeys.SELECTED_CURRENCY, jsonEncode(aSelectedCurrency));

    return mSelectedCurrency = aSelectedCurrency;
  }

  @action
  Future<void> setLanguage(String aCode) async {
    log("Selected language $aCode");
    await setValue(SELECTED_LANGUAGE_CODE, aCode);

    selectedLanguageDataModel = getSelectedLanguageModel(defaultLanguage: AppConstant.defaultLanguage);
    selectedLanguage = getSelectedLanguageModel(defaultLanguage: AppConstant.defaultLanguage);
    return null;
  }

  @action
  Future<void> setUid(String value, {bool isInitializing = false}) async {
    uid = value;
    if (isInitializing) await setValue(SharedPreferenceKeys.uid, value);
  }

  @action
  Future<void> setLoggedIn(bool val, {bool isInitializing = false}) async {
    isLoggedIn = val;
    if (isInitializing) await setValue(SharedPreferenceKeys.isLoggedIn, val);
  }

  @action
  Future<void> setSocialLogin(bool val, {bool isInitializing = false}) async {
    isSocialLogin = val;
    if (isInitializing) await setValue(SharedPreferenceKeys.isSocialLogin, val);
  }

  @action
  Future<void> setFirstName(String value, {bool isInitializing = false}) async {
    firstName = value;
    if (isInitializing) await setValue(SharedPreferenceKeys.firstName, value);
  }

  @action
  Future<void> setEmail(String value, {bool isInitializing = false}) async {
    email = value;
    if (isInitializing) await setValue(SharedPreferenceKeys.email, value);
  }

  @action
  Future<void> setPhotoUrl(String value, {bool isInitializing = false}) async {
    photoUrl = value;
    if (isInitializing) await setValue(SharedPreferenceKeys.photoUrl, value);
  }

  @action
  Future<void> setEmailLogin(bool value, {bool isInitializing = false}) async {
    isEmailLogin = value;
    if (isInitializing) await setValue(SharedPreferenceKeys.isEmailLogin, value);
  }

  @action
  Future<void> setTester(bool value, {bool isInitializing = false}) async {
    isTester = value;
    if (isInitializing) await setValue(SharedPreferenceKeys.isTester, value);
  }

  @action
  Future<void> setIsLoading(bool val) async {
    isLoading = val;
  }

  Future<void> setDarkMode(bool aIsDarkMode) async {
    isDarkMode = aIsDarkMode;

    if (isDarkMode) {
      textPrimaryColorGlobal = Colors.white;
      textSecondaryColorGlobal = textSecondaryColor;

      defaultLoaderBgColorGlobal = themePrimaryColor;
      appButtonBackgroundColorGlobal = themePrimaryColor;
      shadowColorGlobal = Colors.white12;
      defaultElevation = 0;
      defaultSpreadRadius = 0;

      defaultBlurRadius = 0;
      setStatusBarColor(primaryColor, statusBarIconBrightness: Brightness.light);
    } else {
      textPrimaryColorGlobal = textPrimaryColor;
      textSecondaryColorGlobal = textSecondaryColor;
      defaultElevation = 16;
      defaultLoaderBgColorGlobal = Colors.white;
      appButtonBackgroundColorGlobal = Colors.white;
      shadowColorGlobal = Colors.black12;
      defaultElevation = 0;
      defaultSpreadRadius = 0.8;

      defaultBlurRadius = 1;
      setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.light);
    }
  }

  @action
  void setConnectionState(ConnectivityResult val) {
    connectivityResult = val;
  }

  bool isItemInFav({required String id}) {
    return favCoinList.any((element) {
      return element == id;
    });
  }

  @action
  Future<void> addToFav({required String id}) async {
    favCoinList.add(id);
  }

  @action
  Future<void> removeFromFav({required String id}) async {
    favCoinList.removeWhere((element) => element == id);
  }
}
