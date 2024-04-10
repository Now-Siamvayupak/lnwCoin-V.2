// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on AppStoreBase, Store {
  Computed<bool>? _$isNetworkConnectedComputed;

  @override
  bool get isNetworkConnected => (_$isNetworkConnectedComputed ??= Computed<bool>(() => super.isNetworkConnected, name: 'AppStoreBase.isNetworkConnected')).value;

  late final _$selectedLanguageAtom = Atom(name: 'AppStoreBase.selectedLanguage', context: context);

  @override
  LanguageDataModel? get selectedLanguage {
    _$selectedLanguageAtom.reportRead();
    return super.selectedLanguage;
  }

  @override
  set selectedLanguage(LanguageDataModel? value) {
    _$selectedLanguageAtom.reportWrite(value, super.selectedLanguage, () {
      super.selectedLanguage = value;
    });
  }

  late final _$mSelectedGraphColorAtom = Atom(name: 'AppStoreBase.mSelectedGraphColor', context: context);

  @override
  Color get mSelectedGraphColor {
    _$mSelectedGraphColorAtom.reportRead();
    return super.mSelectedGraphColor;
  }

  @override
  set mSelectedGraphColor(Color value) {
    _$mSelectedGraphColorAtom.reportWrite(value, super.mSelectedGraphColor, () {
      super.mSelectedGraphColor = value;
    });
  }

  late final _$mSelectedMarketTypeAtom = Atom(name: 'AppStoreBase.mSelectedMarketType', context: context);

  @override
  ChartMarketType get mSelectedMarketType {
    _$mSelectedMarketTypeAtom.reportRead();
    return super.mSelectedMarketType;
  }

  @override
  set mSelectedMarketType(ChartMarketType value) {
    _$mSelectedMarketTypeAtom.reportWrite(value, super.mSelectedMarketType, () {
      super.mSelectedMarketType = value;
    });
  }

  late final _$mDashboardTypeAtom = Atom(name: 'AppStoreBase.mDashboardType', context: context);

  @override
  DefaultSetting? get mDashboardType {
    _$mDashboardTypeAtom.reportRead();
    return super.mDashboardType;
  }

  @override
  set mDashboardType(DefaultSetting? value) {
    _$mDashboardTypeAtom.reportWrite(value, super.mDashboardType, () {
      super.mDashboardType = value;
    });
  }

  late final _$mDefaultChartAtom = Atom(name: 'AppStoreBase.mDefaultChart', context: context);

  @override
  DefaultSetting? get mDefaultChart {
    _$mDefaultChartAtom.reportRead();
    return super.mDefaultChart;
  }

  @override
  set mDefaultChart(DefaultSetting? value) {
    _$mDefaultChartAtom.reportWrite(value, super.mDefaultChart, () {
      super.mDefaultChart = value;
    });
  }

  late final _$mDefaultTrendingCardAtom = Atom(name: 'AppStoreBase.mDefaultTrendingCard', context: context);

  @override
  DefaultSetting? get mDefaultTrendingCard {
    _$mDefaultTrendingCardAtom.reportRead();
    return super.mDefaultTrendingCard;
  }

  @override
  set mDefaultTrendingCard(DefaultSetting? value) {
    _$mDefaultTrendingCardAtom.reportWrite(value, super.mDefaultTrendingCard, () {
      super.mDefaultTrendingCard = value;
    });
  }

  late final _$mSelectedCurrencyAtom = Atom(name: 'AppStoreBase.mSelectedCurrency', context: context);

  @override
  CurrencyModel? get mSelectedCurrency {
    _$mSelectedCurrencyAtom.reportRead();
    return super.mSelectedCurrency;
  }

  @override
  set mSelectedCurrency(CurrencyModel? value) {
    _$mSelectedCurrencyAtom.reportWrite(value, super.mSelectedCurrency, () {
      super.mSelectedCurrency = value;
    });
  }

  late final _$mIsLoadingAtom = Atom(name: 'AppStoreBase.mIsLoading', context: context);

  @override
  bool? get mIsLoading {
    _$mIsLoadingAtom.reportRead();
    return super.mIsLoading;
  }

  @override
  set mIsLoading(bool? value) {
    _$mIsLoadingAtom.reportWrite(value, super.mIsLoading, () {
      super.mIsLoading = value;
    });
  }

  late final _$isLoggedInAtom = Atom(name: 'AppStoreBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$uidAtom = Atom(name: 'AppStoreBase.uid', context: context);

  @override
  String get uid {
    _$uidAtom.reportRead();
    return super.uid;
  }

  @override
  set uid(String value) {
    _$uidAtom.reportWrite(value, super.uid, () {
      super.uid = value;
    });
  }

  late final _$firstNameAtom = Atom(name: 'AppStoreBase.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$emailAtom = Atom(name: 'AppStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$photoUrlAtom = Atom(name: 'AppStoreBase.photoUrl', context: context);

  @override
  String get photoUrl {
    _$photoUrlAtom.reportRead();
    return super.photoUrl;
  }

  @override
  set photoUrl(String value) {
    _$photoUrlAtom.reportWrite(value, super.photoUrl, () {
      super.photoUrl = value;
    });
  }

  late final _$isEmailLoginAtom = Atom(name: 'AppStoreBase.isEmailLogin', context: context);

  @override
  bool get isEmailLogin {
    _$isEmailLoginAtom.reportRead();
    return super.isEmailLogin;
  }

  @override
  set isEmailLogin(bool value) {
    _$isEmailLoginAtom.reportWrite(value, super.isEmailLogin, () {
      super.isEmailLogin = value;
    });
  }

  late final _$isTesterAtom = Atom(name: 'AppStoreBase.isTester', context: context);

  @override
  bool get isTester {
    _$isTesterAtom.reportRead();
    return super.isTester;
  }

  @override
  set isTester(bool value) {
    _$isTesterAtom.reportWrite(value, super.isTester, () {
      super.isTester = value;
    });
  }

  late final _$isLoadingAtom = Atom(name: 'AppStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isDarkModeAtom = Atom(name: 'AppStoreBase.isDarkMode', context: context);

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
    });
  }

  late final _$isSocialLoginAtom = Atom(name: 'AppStoreBase.isSocialLogin', context: context);

  @override
  bool get isSocialLogin {
    _$isSocialLoginAtom.reportRead();
    return super.isSocialLogin;
  }

  @override
  set isSocialLogin(bool value) {
    _$isSocialLoginAtom.reportWrite(value, super.isSocialLogin, () {
      super.isSocialLogin = value;
    });
  }

  late final _$favCoinListAtom = Atom(name: 'AppStoreBase.favCoinList', context: context);

  @override
  List<String> get favCoinList {
    _$favCoinListAtom.reportRead();
    return super.favCoinList;
  }

  @override
  set favCoinList(List<String> value) {
    _$favCoinListAtom.reportWrite(value, super.favCoinList, () {
      super.favCoinList = value;
    });
  }

  late final _$connectivityResultAtom = Atom(name: 'AppStoreBase.connectivityResult', context: context);

  @override
  ConnectivityResult get connectivityResult {
    _$connectivityResultAtom.reportRead();
    return super.connectivityResult;
  }

  @override
  set connectivityResult(ConnectivityResult value) {
    _$connectivityResultAtom.reportWrite(value, super.connectivityResult, () {
      super.connectivityResult = value;
    });
  }

  late final _$setSelectedGraphColorAsyncAction = AsyncAction('AppStoreBase.setSelectedGraphColor', context: context);

  @override
  Future<dynamic> setSelectedGraphColor(Color aColor) {
    return _$setSelectedGraphColorAsyncAction.run(() => super.setSelectedGraphColor(aColor));
  }

  late final _$setSelectedMarketTypeAsyncAction = AsyncAction('AppStoreBase.setSelectedMarketType', context: context);

  @override
  Future<dynamic> setSelectedMarketType(ChartMarketType aType) {
    return _$setSelectedMarketTypeAsyncAction.run(() => super.setSelectedMarketType(aType));
  }

  late final _$setSelectedDashboardAsyncAction = AsyncAction('AppStoreBase.setSelectedDashboard', context: context);

  @override
  Future<dynamic> setSelectedDashboard(DefaultSetting aType) {
    return _$setSelectedDashboardAsyncAction.run(() => super.setSelectedDashboard(aType));
  }

  late final _$setSelectedDefaultChartAsyncAction = AsyncAction('AppStoreBase.setSelectedDefaultChart', context: context);

  @override
  Future<dynamic> setSelectedDefaultChart(DefaultSetting aType) {
    return _$setSelectedDefaultChartAsyncAction.run(() => super.setSelectedDefaultChart(aType));
  }

  late final _$setSelectedDefaultTrendingCardAsyncAction = AsyncAction('AppStoreBase.setSelectedDefaultTrendingCard', context: context);

  @override
  Future<dynamic> setSelectedDefaultTrendingCard(DefaultSetting aType) {
    return _$setSelectedDefaultTrendingCardAsyncAction.run(() => super.setSelectedDefaultTrendingCard(aType));
  }

  late final _$setLoadingAsyncAction = AsyncAction('AppStoreBase.setLoading', context: context);

  @override
  Future<dynamic> setLoading(bool aIsLoading) {
    return _$setLoadingAsyncAction.run(() => super.setLoading(aIsLoading));
  }

  late final _$setSelectedCurrencyAsyncAction = AsyncAction('AppStoreBase.setSelectedCurrency', context: context);

  @override
  Future<CurrencyModel> setSelectedCurrency(CurrencyModel aSelectedCurrency) {
    return _$setSelectedCurrencyAsyncAction.run(() => super.setSelectedCurrency(aSelectedCurrency));
  }

  late final _$setLanguageAsyncAction = AsyncAction('AppStoreBase.setLanguage', context: context);

  @override
  Future<void> setLanguage(String aCode) {
    return _$setLanguageAsyncAction.run(() => super.setLanguage(aCode));
  }

  late final _$setUidAsyncAction = AsyncAction('AppStoreBase.setUid', context: context);

  @override
  Future<void> setUid(String value, {bool isInitializing = false}) {
    return _$setUidAsyncAction.run(() => super.setUid(value, isInitializing: isInitializing));
  }

  late final _$setLoggedInAsyncAction = AsyncAction('AppStoreBase.setLoggedIn', context: context);

  @override
  Future<void> setLoggedIn(bool val, {bool isInitializing = false}) {
    return _$setLoggedInAsyncAction.run(() => super.setLoggedIn(val, isInitializing: isInitializing));
  }

  late final _$setSocialLoginAsyncAction = AsyncAction('AppStoreBase.setSocialLogin', context: context);

  @override
  Future<void> setSocialLogin(bool val, {bool isInitializing = false}) {
    return _$setSocialLoginAsyncAction.run(() => super.setSocialLogin(val, isInitializing: isInitializing));
  }

  late final _$setFirstNameAsyncAction = AsyncAction('AppStoreBase.setFirstName', context: context);

  @override
  Future<void> setFirstName(String value, {bool isInitializing = false}) {
    return _$setFirstNameAsyncAction.run(() => super.setFirstName(value, isInitializing: isInitializing));
  }

  late final _$setEmailAsyncAction = AsyncAction('AppStoreBase.setEmail', context: context);

  @override
  Future<void> setEmail(String value, {bool isInitializing = false}) {
    return _$setEmailAsyncAction.run(() => super.setEmail(value, isInitializing: isInitializing));
  }

  late final _$setPhotoUrlAsyncAction = AsyncAction('AppStoreBase.setPhotoUrl', context: context);

  @override
  Future<void> setPhotoUrl(String value, {bool isInitializing = false}) {
    return _$setPhotoUrlAsyncAction.run(() => super.setPhotoUrl(value, isInitializing: isInitializing));
  }

  late final _$setEmailLoginAsyncAction = AsyncAction('AppStoreBase.setEmailLogin', context: context);

  @override
  Future<void> setEmailLogin(bool value, {bool isInitializing = false}) {
    return _$setEmailLoginAsyncAction.run(() => super.setEmailLogin(value, isInitializing: isInitializing));
  }

  late final _$setTesterAsyncAction = AsyncAction('AppStoreBase.setTester', context: context);

  @override
  Future<void> setTester(bool value, {bool isInitializing = false}) {
    return _$setTesterAsyncAction.run(() => super.setTester(value, isInitializing: isInitializing));
  }

  late final _$setIsLoadingAsyncAction = AsyncAction('AppStoreBase.setIsLoading', context: context);

  @override
  Future<void> setIsLoading(bool val) {
    return _$setIsLoadingAsyncAction.run(() => super.setIsLoading(val));
  }

  late final _$addToFavAsyncAction = AsyncAction('AppStoreBase.addToFav', context: context);

  @override
  Future<void> addToFav({required String id}) {
    return _$addToFavAsyncAction.run(() => super.addToFav(id: id));
  }

  late final _$removeFromFavAsyncAction = AsyncAction('AppStoreBase.removeFromFav', context: context);

  @override
  Future<void> removeFromFav({required String id}) {
    return _$removeFromFavAsyncAction.run(() => super.removeFromFav(id: id));
  }

  late final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase', context: context);

  @override
  void setConnectionState(ConnectivityResult val) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(name: 'AppStoreBase.setConnectionState');
    try {
      return super.setConnectionState(val);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedLanguage: ${selectedLanguage},
mSelectedGraphColor: ${mSelectedGraphColor},
mSelectedMarketType: ${mSelectedMarketType},
mDashboardType: ${mDashboardType},
mDefaultChart: ${mDefaultChart},
mDefaultTrendingCard: ${mDefaultTrendingCard},
mSelectedCurrency: ${mSelectedCurrency},
mIsLoading: ${mIsLoading},
isLoggedIn: ${isLoggedIn},
uid: ${uid},
firstName: ${firstName},
email: ${email},
photoUrl: ${photoUrl},
isEmailLogin: ${isEmailLogin},
isTester: ${isTester},
isLoading: ${isLoading},
isDarkMode: ${isDarkMode},
isSocialLogin: ${isSocialLogin},
favCoinList: ${favCoinList},
connectivityResult: ${connectivityResult},
isNetworkConnected: ${isNetworkConnected}
    ''';
  }
}
