import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lnwcoin/model/coin_sorting_model.dart';
import 'package:lnwcoin/model/currency_model.dart';
import 'package:lnwcoin/model/default_setting.dart';
import 'package:lnwcoin/model/material_you_model.dart';
import 'package:lnwcoin/network/portfolio_services.dart';
import 'package:lnwcoin/screens/splash_screen.dart';
import 'package:lnwcoin/services/auth_services.dart';
import 'package:lnwcoin/services/user_services.dart';
import 'package:lnwcoin/store/AppStore.dart';
import 'package:lnwcoin/store/CategoriesStore.dart';
import 'package:lnwcoin/store/ChartStore.dart';
import 'package:lnwcoin/store/CoinStore.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/utils/app_functions.dart';
import 'package:lnwcoin/utils/app_localizations.dart';
import 'package:lnwcoin/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:sqflite/sqflite.dart';

AppStore appStore = AppStore();
ChartStore chartStore = ChartStore();
CoinStore coinStore = CoinStore();
CategoriesStore categoriesStore = CategoriesStore();
FirebaseFirestore fireStore = FirebaseFirestore.instance;

UserService userService = UserService();
AuthService authService = AuthService();
PortfolioService portfolioService = PortfolioService();

AppLocalizations? appLocalizations;
Database? localDbInstance;

SortingTypeModel? selectedSortingType;
SortingTypeModel? selectedCategorySortingType;
SortingTypeModel? selectedIntervalTypes;

int mAdShowCount = 0;
int numInterstitialLoadAttempts = 0;
int maxFailedLoadAttempts = 0;

List<DefaultSetting> getDashboard = DefaultSetting.getDashboardCharts;
List<DefaultSetting> getMarketType = DefaultSetting.getChartMarketDefaultType;
List<DefaultSetting> getCharts = DefaultSetting.getDefaultCharts;
List<DefaultSetting> getTrendingCard = DefaultSetting.getTrendingCard;
//List<String> favCoinList = [];

OneSignal oneSignal = OneSignal();

bool isCurrentlyOnNoInternet = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  if (isMobile) {
    await Firebase.initializeApp();
  }

  Function? originalOnError = FlutterError.onError;

  FlutterError.onError = (FlutterErrorDetails errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    originalOnError!(errorDetails);
  };
  defaultSetting;

  await initialize(aLocaleLanguageList: getAppLanguage, defaultLanguage: AppConstant.defaultLanguage);

  appStore.setLoggedIn(getBoolAsync(SharedPreferenceKeys.isLoggedIn));
  appStore.setFirstName(getStringAsync(SharedPreferenceKeys.firstName));
  appStore.setEmail(getStringAsync(SharedPreferenceKeys.email));
  appStore.setPhotoUrl(getStringAsync(SharedPreferenceKeys.photoUrl));
  appStore.setUid(getStringAsync(SharedPreferenceKeys.uid));
  appStore.setEmailLogin(getBoolAsync(SharedPreferenceKeys.isEmailLogin));
  appStore.setTester(getBoolAsync(SharedPreferenceKeys.isTester));
  appStore.setSocialLogin(getBoolAsync(SharedPreferenceKeys.isSocialLogin));

  appStore.setLanguage(getStringAsync(SELECTED_LANGUAGE_CODE, defaultValue: AppConstant.defaultLanguage));

  int themeModeIndex = getIntAsync(THEME_MODE_INDEX);
  if (themeModeIndex == ThemeModeLight) {
    appStore.setDarkMode(false);
  } else if (themeModeIndex == ThemeModeDark) {
    appStore.setDarkMode(true);
  }

  if (getBoolAsync(SharedPreferenceKeys.IS_DARK_MODE, defaultValue: true)) {
    appStore.setDarkMode(true);
  } else {
    appStore.setDarkMode(false);
  }

  appStore.setSelectedCurrency(CurrencyModel.fromJson(jsonDecode(getStringAsync(SharedPreferenceKeys.SELECTED_CURRENCY, defaultValue: jsonEncode(AppConstant.defaultCurrency)))));
  appStore.setSelectedGraphColor(AppLists.gradientColor[getIntAsync(SharedPreferenceKeys.SELECTED_COLOR_INDEX)]);
  appStore.setSelectedMarketType(ChartMarketType.values[getIntAsync(SharedPreferenceKeys.MARKET_TYPE_SELECTED_INDEX)]);
  appStore.setSelectedDashboard(getDashboard[getIntAsync(SharedPreferenceKeys.DASHBOARD_SELECTED_INDEX, defaultValue: 0)]);
  appStore.setSelectedDefaultTrendingCard(getTrendingCard[getIntAsync(SharedPreferenceKeys.TRENDING_CARD_SELECTED_INDEX, defaultValue: 0)]);
  appStore.setSelectedDefaultChart(getCharts[getIntAsync(SharedPreferenceKeys.CHART_SELECTED_INDEX, defaultValue: 0)]);

  coinStore.setSelectedSortType(getIntAsync(SharedPreferenceKeys.SORTING_ORDER_SELECTED_INDEX, defaultValue: AppConstant.defaultSortingOrderIndex));

  categoriesStore.setSelectedSortType(getIntAsync(SharedPreferenceKeys.SORTING_CATEGORIES_SELECTED_INDEX, defaultValue: AppConstant.defaultCategoriesOrderIndex));

  coinStore.setSelectedIntervalType(getIntAsync(SharedPreferenceKeys.DEFAULT_INTERVAL_SELECTED_INDEX, defaultValue: AppConstant.defaultIntervalIndex));
  if (isMobile) {
    OneSignal.initialize(AppConstant.oneSignalAppID);
    OneSignal.Notifications.requestPermission(true);

    /*OneSignal.shared.setAppId(AppConstant.oneSignalAppID).then((value) {
      OneSignal.shared.setRequiresUserPrivacyConsent(true);

      OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent event) {
        event.complete(event.notification);
      });

      oneSignal.disablePush(false);
      oneSignal.consentGranted(true);
      oneSignal.requiresUserPrivacyConsent();
    });
    await oneSignal.setAppId(AppConstant.oneSignalAppID);*/
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((event) {
      appStore.setConnectionState(event);
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RestartAppWidget(
      child: FutureBuilder<Color>(
        future: getMaterialYouData(),
        builder: (_, snap) {
          return Observer(
            builder: (_) => MaterialApp(
              title: AppConstant.appName,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(color: snap.data),
              darkTheme: AppTheme.darkTheme(color: snap.data),
              themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              home: SplashScreen(),
              navigatorKey: navigatorKey,
              supportedLocales: LanguageDataModel.languageLocales(),
              localizationsDelegates: [AppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
              localeResolutionCallback: (locale, supportedLocales) => locale,
              locale: Locale(appStore.selectedLanguage!.languageCode.validate(value: AppConstant.defaultLanguage)),
              scrollBehavior: SBehavior(),
            ),
          );
        },
      ),
    );
  }
}
