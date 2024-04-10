import 'package:lnwcoin/component/Market_type_based_on_date_component.dart';
import 'package:lnwcoin/component/coin_detail_component.dart';
import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/component/detail_component.dart';
import 'package:lnwcoin/component/key_metrics_component.dart';
import 'package:lnwcoin/component/market_chart_component.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/screens/exchange_screen.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

import 'companies_screen.dart';

// ignore: must_be_immutable
class CoinDetailScreen extends StatefulWidget {
  String id;
  String name;

  CoinDetailScreen({required this.id, required this.name});

  @override
  _CoinDetailScreenState createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends State<CoinDetailScreen> with TickerProviderStateMixin {
  CoinDetailModel? coinData;
  bool isFav = false;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    fetchCoinData();
    _createInterstitialAd();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: Admob.mAdMobInterstitialId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          print('$ad loaded');
          _interstitialAd = ad;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
          numInterstitialLoadAttempts += 1;
          _interstitialAd = null;

          if (numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            _createInterstitialAd();
          }
        },
      ),
    );
  }

  Future fetchCoinData() async {
    appStore.setLoading(true);

    SqliteMethods.getFavoriteCoins().then((element) {
      appStore.favCoinList.clear();
      element.forEach((element) {
        appStore.favCoinList.add(element.id!);
      });
    }).catchError((e) {
      toast(e.toString());
    }).whenComplete(() {
      appStore.setLoading(false);
    });
  }

  @override
  void dispose() {
    _showInterstitialAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        appBar: AppBar(
          title: Text('${widget.name.validate()}', style: boldTextStyle(size: 22)),
          actions: [
            IconButton(
              onPressed: () {
                ExchangeScreen(ticker: coinData!.tickers!).launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
              },
              icon: Icon(Icons.import_export_outlined, size: 24),
            ),
            IconButton(
              onPressed: () {
                DetailComponent(data: coinData!).launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
              },
              icon: Icon(Icons.info_outline, size: 24),
            ),
            IconButton(
              onPressed: () {
                CompaniesScreen(coinId: widget.id).launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
              },
              icon: Image.asset('images/social_images/company.png', height: 24, width: 24, fit: BoxFit.fitWidth, color: context.iconColor),
            ),
          ],
        ),
        body: SnapHelperWidget<CoinDetailModel>(
          future: getCoinDetail(name: widget.id),
          loadingWidget: LoaderWidget(),
          errorBuilder: (p0) => CommonErrorBuilder(text: p0),
          onSuccess: (data) {
            if (coinData == null) {
              coinData = data;
            }
            return Container(
              child: RefreshIndicator(
                color: themePrimaryColor,
                backgroundColor: context.cardColor,
                triggerMode: RefreshIndicatorTriggerMode.onEdge,
                onRefresh: () async {
                  setState(() {});
                  await 2.seconds.delay;
                },
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.height,
                      CoinDetailComponent(data: data).paddingSymmetric(horizontal: 16),
                      16.height,
                      Observer(builder: (context) {
                        return MarketTypeBasedOnDateComponent(
                          data: coinData,
                          onUpdate: () async {
                            await SqliteMethods.updateFavoriteStatus(appStore.isItemInFav(id: coinData!.id.validate()) ? 0 : 1, coinData!.id.toString()).then((value) {
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                              snackBar(
                                context,
                                title: appStore.isItemInFav(id: coinData!.id.validate())
                                    ? '${'lbl_removed'.translate} ${coinData!.name} ${'lbl_from_favorite'.translate}'
                                    : '${'lbl_added'.translate} ${coinData!.name} ${'lbl_to_favorite'.translate}',
                              );
                              if (appStore.isItemInFav(id: coinData!.id.validate())) {
                                appStore.removeFromFav(id: coinData!.id.validate());
                              } else {
                                appStore.addToFav(id: coinData!.id.validate());
                              }
                            }).catchError((e) {
                              log(e.toString());
                            });
                            setState(() {});
                          },
                        );
                      }),
                      MarketChartComponent(coinId: data.id!),
                      KeyMetricsComponent(marketData: data.market_data!),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
