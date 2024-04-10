import 'package:lnwcoin/component/coin_description_component.dart';
import 'package:lnwcoin/component/coin_detail_component.dart';
import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/component/key_metrics_component.dart';
import 'package:lnwcoin/component/market_chart_component.dart';
import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'companies_screen.dart';

class CoinDetailScreen2 extends StatefulWidget {
  final String id;
  final String name;
  final String image;

  CoinDetailScreen2({required this.id, required this.name, required this.image});

  @override
  _CoinDetailScreen2State createState() => _CoinDetailScreen2State();
}

class _CoinDetailScreen2State extends State<CoinDetailScreen2> {
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
        ));
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
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
          centerTitle: false,
          title: cachedImage(widget.image, width: 35, height: 35),
          actions: [
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
          onSuccess: (snap) {
            if (coinData == null) {
              coinData = snap;
              if (appStore.favCoinList.contains(coinData!.id!)) {
                isFav = true;
              } else {
                isFav = false;
              }
            }
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*Align(
                      alignment: Alignment.topRight,
                      child: Icon(isFav ? Icons.favorite_outlined : Icons.favorite_outline, size: 28, color: Colors.red).onTap(() {
                        SqliteMethods.updateFavoriteStatus(isFav ? 0 : 1, coinData!.id.toString()).then((value) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          snackBar(
                            context,
                            title:
                                isFav ? '${'lbl_removed'.translate} ${coinData!.name} ${'lbl_from_favorite'.translate}' : '${'lbl_added'.translate} ${coinData!.name} ${'lbl_to_favorite'.translate}',
                          );
                          setState(() {
                            isFav = !isFav;
                          });
                        }).catchError((e) {
                          log(e.toString());
                        });
                      }),
                    ).paddingOnly(right: 8),
                    16.height,*/
                    CoinDetailComponent(
                      data: snap,
                      dashboardType: getSelectedDashboard,
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
                    ).paddingSymmetric(horizontal: 16),
                    16.height,
                    MarketChartComponent(coinId: snap.id!, dashboardType: getSelectedDashboard),
                    16.height,
                    KeyMetricsComponent(marketData: snap.market_data!, dashboardType: getSelectedDashboard),
                    16.height,
                    CoinDescriptionWidget(snap: snap)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
