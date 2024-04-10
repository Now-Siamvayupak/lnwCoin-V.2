import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/component/most_searched_coins.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/search_model.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchString = "";

  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _createInterstitialAd();
    if (mAdShowCount < 5) {
      mAdShowCount++;
    } else {
      mAdShowCount = 0;
      _showInterstitialAd();
    }
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

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return AppScaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('lbl_coin_market'.translate, style: boldTextStyle(size: 22)),
          ),
          body: Stack(
            children: [
              AppTextField(
                textFieldType: TextFieldType.OTHER,
                decoration: AppCommon.inputDecoration('lbl_search'.translate).copyWith(
                  suffixIcon: Icon(Icons.search, color: context.iconColor),
                  fillColor: appStore.isDarkMode ? cardColor : Colors.white,
                  border: InputBorder.none,
                ),
                onChanged: (s) {
                  searchString = s;
                  setState(() {});
                },
              ).paddingSymmetric(horizontal: 16),
              SnapHelperWidget<List<Coin>>(
                loadingWidget: LoaderWidget(),
                errorBuilder: (p0) {
                  return CommonErrorBuilder(text: p0);
                },
                future: SqliteMethods().getSearchedCoins(searchString: searchString),
                onSuccess: (snap) {
                  if (snap.length <= 0) {
                    return SizedBox(
                      child: MostSearchedCoins(),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snap.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            cachedImage(snap[index].thumb.validate(), usePlaceholderIfUrlEmpty: true, width: 30, height: 30),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${snap[index].name.validate()}', style: boldTextStyle()),
                                Text('${snap[index].symbol.validate()}', style: secondaryTextStyle()),
                              ],
                            ).expand(),
                            Text('#${snap[index].market_cap_rank.validate()}', style: boldTextStyle()),
                          ],
                        ),
                      ).onTap(
                        () {
                          hideKeyboard(context);
                          getSelectedDetailScreen(
                            name: snap[index].name.validate(),
                            id: snap[index].id.validate(),
                            image: snap[index].large.validate(),
                          ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                        },
                      );
                    },
                  );
                },
              ).paddingTop(60),
            ],
          ),
        );
      },
    );
  }
}
