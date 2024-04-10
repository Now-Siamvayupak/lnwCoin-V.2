import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/search_model.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/crypto_follow_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

class AddCryptoScreen extends StatefulWidget {
  @override
  _AddCryptoScreenState createState() => _AddCryptoScreenState();
}

class _AddCryptoScreenState extends State<AddCryptoScreen> {
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<Coin> mainList = [];
  bool isLastPage = false;

  InterstitialAd? _interstitialAd;

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    fetchCategoryData();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (!isLastPage) {
          page++;
          loadMoreData();
        }
      }
    });
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

  Future fetchCategoryData() async {
    appStore.setLoading(true);

    SqliteMethods.getCoins(page: page, perPage: 50, searchString: controller.text.trim()).then((value) {
      if (controller.text.trim().isNotEmpty) {
        mainList.clear();
        page = 1;
        isLastPage = false;
      }

      mainList.addAll(value);
      setState(() {});
    }).catchError((e) {
      toast(e.toString());
    }).whenComplete(() {
      appStore.setLoading(false);
    });
  }

  Future loadMoreData() async {
    appStore.setLoading(true);
    await SqliteMethods.getCoins(page: page, perPage: 50).then((res) {
      if (!mounted) return;
      appStore.setLoading(false);
      mainList.addAll(res);

      isLastPage = false;
      setState(() {});
    }).catchError((error) {
      if (!mounted) return;
      setState(() {
        isLastPage = true;
        appStore.setLoading(false);
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    scrollController.dispose();
    _showInterstitialAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'lbl_add_coins_to_favourites'.translate,
            style: boldTextStyle(size: 22),
          ),
        ),
        body: Container(
          child: Stack(
            children: [
              AppTextField(
                controller: controller,
                textFieldType: TextFieldType.OTHER,
                decoration: AppCommon.inputDecoration('lbl_search'.translate).copyWith(
                  suffixIcon: Icon(Icons.search, color: Colors.white),
                ),
                onChanged: (s) {
                  fetchCategoryData();
                },
              ).paddingSymmetric(horizontal: 16),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                controller: scrollController,
                itemCount: mainList.length,
                itemBuilder: (context, index) {
                  return CryptoFollowWidget(
                    coin: mainList[index],
                    index: index + 1,
                    onSuccess: () {
                      setState(() {});
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 0,
                    thickness: 0.8,
                    indent: 60,
                    color: appStore.isDarkMode ? cardColor : grey.withOpacity(0.3),
                  );
                },
              ).paddingTop(60),
            ],
          ),
        ),
      ),
    );
  }
}
