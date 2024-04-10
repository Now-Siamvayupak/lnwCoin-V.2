import 'dart:io';

import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

void get defaultSetting {
  textPrimaryColorGlobal = Colors.white;
  textSecondaryColorGlobal = Colors.white60;
  shadowColorGlobal = Colors.grey.withOpacity(0.2);
  defaultInkWellSplashColor = themePrimaryColor.withOpacity(0.2);
  defaultInkWellHoverColor = themePrimaryColor.withOpacity(0.2);
  appButtonBackgroundColorGlobal = themePrimaryColor;
  defaultRadius = 8.0;
  defaultAppButtonRadius = 8.0;
  defaultAppButtonElevation = 0.0;
  defaultBlurRadius = 0.0;
  defaultSpreadRadius = 0.0;
  defaultAppBarElevation = 0.0;
  textBoldSizeGlobal = 16.0;
  textPrimarySizeGlobal = 16.0;
  textSecondarySizeGlobal = 14.0;
}

List<LanguageDataModel> get getAppLanguage {
  List<LanguageDataModel> list = [];
  list.add(LanguageDataModel(id: 0, name: "English", languageCode: 'en'));
  list.add(LanguageDataModel(id: 1, name: "Hindi", languageCode: 'hi'));
  list.add(LanguageDataModel(id: 2, name: "Gujarati", languageCode: 'gu'));
  list.add(LanguageDataModel(id: 3, name: "Dutch", languageCode: 'nl'));
  list.add(LanguageDataModel(id: 4, name: "French", languageCode: 'fr'));
  list.add(LanguageDataModel(id: 5, name: "Italian", languageCode: 'it'));
  list.add(LanguageDataModel(id: 6, name: "Bangla", languageCode: 'bn'));
  list.add(LanguageDataModel(id: 7, name: "Nepali", languageCode: 'ne'));
  list.add(LanguageDataModel(id: 8, name: "Japanese", languageCode: 'ja'));
  list.add(LanguageDataModel(id: 9, name: "Arabic", languageCode: 'ar'));
  list.add(LanguageDataModel(id: 10, name: "Portuguese", languageCode: 'pt'));
  list.add(LanguageDataModel(id: 11, name: "Russian", languageCode: 'ru'));
  list.add(LanguageDataModel(id: 12, name: "Danish", languageCode: 'da'));
  list.add(LanguageDataModel(id: 13, name: "Indonesian", languageCode: 'id'));
  list.add(LanguageDataModel(id: 14, name: "Tamil", languageCode: 'ta'));
  list.add(LanguageDataModel(id: 15, name: "Telugu", languageCode: 'te'));
  list.add(LanguageDataModel(id: 16, name: "Spanish", languageCode: 'es'));
  list.add(LanguageDataModel(id: 17, name: "Turkish", languageCode: 'tr'));
  list.add(LanguageDataModel(id: 18, name: "German", languageCode: 'de'));
  list.add(LanguageDataModel(id: 19, name: "Panjabi", languageCode: 'pa'));

  return list;
}

BannerAd buildBannerAd() {
  return BannerAd(
    adUnitId: Admob.mAdMobBannerId,
    size: AdSize.fullBanner,
    listener: BannerAdListener(onAdLoaded: (ad) {
      //
    }),
    request: AdRequest(),
  );
}

Future<InterstitialAd?> createInterstitialAd({required InterstitialAd? interstitialAd}) async {
  InterstitialAd.load(
    adUnitId: Platform.isAndroid ? 'ca-app-pub-3940256099942544/1033173712' : 'ca-app-pub-3940256099942544/4411468910',
    request: AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (InterstitialAd ad) {
        interstitialAd = ad;
        interstitialAd!.setImmersiveMode(true);
      },
      onAdFailedToLoad: (LoadAdError error) {
        print('InterstitialAd failed to load: $error.');
        numInterstitialLoadAttempts += 1;
        interstitialAd = null;

        if (numInterstitialLoadAttempts < maxFailedLoadAttempts) {
          createInterstitialAd(interstitialAd: interstitialAd);
        }
      },
    ),
  );

  return interstitialAd;
}

void showInterstitialAd({required InterstitialAd? interstitialAd}) {
  if (interstitialAd == null) {
    print('Warning: attempt to show interstitial before loaded.');
    return;
  }

  interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
    onAdDismissedFullScreenContent: (InterstitialAd ad) {
      print('$ad onAdDismissedFullScreenContent.');
      ad.dispose();
      createInterstitialAd(interstitialAd: interstitialAd);
    },
    onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      print('$ad onAdFailedToShowFullScreenContent: $error');
      ad.dispose();
      createInterstitialAd(interstitialAd: interstitialAd);
    },
  );
  interstitialAd.show();
  interstitialAd = null;
}
