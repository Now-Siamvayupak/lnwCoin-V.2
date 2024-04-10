import 'dart:io';

import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/component/favorite_coin_component.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/screens/about_us_screen.dart';
import 'package:lnwcoin/screens/currency_selection_screen.dart';
import 'package:lnwcoin/screens/default_setting_screen.dart';
import 'package:lnwcoin/screens/language_selection_screen.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/utils/app_localizations.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'categories_screen.dart';
import 'change_password_screen.dart';
import 'edit_profile_screen.dart';
import 'login_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    log('${appStore.isSocialLogin}');
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
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    _showInterstitialAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context);

    return AppScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('lbl_setting'.translate, style: boldTextStyle(size: 22)),
      ),
      body: Observer(
        builder: (_) => Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Observer(
                  builder: (_) => Row(
                    children: [
                      cachedImage(appStore.photoUrl, fit: BoxFit.cover, height: 60, width: 60).cornerRadiusWithClipRRect(100),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(appStore.firstName.validate(), style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                          Text(appStore.email.validate(), style: secondaryTextStyle())
                        ],
                      ).expand(),
                      Icon(Icons.arrow_forward_ios_outlined, size: 12)
                    ],
                  ),
                ).paddingOnly(left: 16, right: context.width() * 0.06, top: 8, bottom: 8).onTap(() {
                  push(EditProfileScreen(), pageRouteAnimation: PageRouteAnimation.Scale);
                }).visible(appStore.isLoggedIn),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  leading: Icon(Icons.login),
                  title: 'lbl_sign_in_and_sign_up'.translate,
                  padding: EdgeInsets.all(16),
                  trailing: TextIcon(text: '', suffix: Icon(Icons.arrow_forward_ios_outlined, size: 12), textStyle: secondaryTextStyle()),
                  onTap: () {
                    LoginScreen(isSetting: true).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                ).visible(!appStore.isLoggedIn),
                Row(
                  children: [
                    appStore.isDarkMode ? Icon(Icons.brightness_2) : Icon(Icons.wb_sunny_rounded),
                    16.width,
                    Text('choose_app_theme'.translate, style: boldTextStyle()).expand(),
                    Switch(
                      value: appStore.isDarkMode,
                      activeTrackColor: themePrimaryColor,
                      inactiveThumbColor: themePrimaryColor,
                      inactiveTrackColor: Colors.grey,
                      activeColor: Colors.white24,
                      onChanged: (val) async {
                        appStore.setDarkMode(val);
                        await setValue(SharedPreferenceKeys.IS_DARK_MODE, val);
                      },
                    ),
                  ],
                ).paddingOnly(left: 16, top: 8, right: 16, bottom: 8).onTap(splashColor: themePrimaryColor, () async {
                  if (getBoolAsync(SharedPreferenceKeys.IS_DARK_MODE)) {
                    appStore.setDarkMode(false);
                    await setValue(SharedPreferenceKeys.IS_DARK_MODE, false);
                  } else {
                    appStore.setDarkMode(true);
                    await setValue(SharedPreferenceKeys.IS_DARK_MODE, true);
                  }
                }),
                SnapHelperWidget<bool>(
                  future: isAndroid12Above(),
                  errorBuilder: (p0) => CommonErrorBuilder(text: p0),
                  onSuccess: (data) {
                    if (data) {
                      return SettingItemWidget(
                        splashColor: themePrimaryColor,
                        leading: Image.asset(
                          'images/app_images/ic_android_12.png',
                          color: appStore.isDarkMode ? Colors.white : black,
                          height: 22,
                          width: 22,
                          fit: BoxFit.cover,
                        ),
                        title: "lbl_enable_theme".translate,
                        trailing: Switch(
                          value: appStore.useMaterialYouTheme,
                          activeTrackColor: themePrimaryColor,
                          inactiveThumbColor: themePrimaryColor,
                          inactiveTrackColor: Colors.grey,
                          activeColor: Colors.white24,
                          onChanged: (v) {
                            showConfirmDialogCustom(context, primaryColor: themePrimaryColor, onAccept: (_) {
                              appStore.setUseMaterialYouTheme(v.validate());

                              RestartAppWidget.init(context);
                            }, title: "lbl_confirm_msg".translate);
                          },
                        ).withHeight(24),
                        onTap: null,
                      );
                    }
                    return Offstage();
                  },
                ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  leading: Icon(Icons.category_outlined),
                  title: "lbl_categories".translate,
                  padding: EdgeInsets.all(16),
                  trailing: TextIcon(text: '', suffix: Icon(Icons.arrow_forward_ios_outlined, size: 12), textStyle: secondaryTextStyle()),
                  onTap: () {
                    CategoriesScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  title: "lbl_favorite_coins".translate,
                  leading: Icon(Icons.favorite_outline),
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    FavoriteCoinComponent().launch(context, pageRouteAnimation: PageRouteAnimation.Fade);
                  },
                  trailing: TextIcon(text: '', suffix: Icon(Icons.arrow_forward_ios_outlined, size: 12), textStyle: secondaryTextStyle()),
                ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  onTap: () {
                    DefaultSettingScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                  leading: Icon(Icons.settings),
                  title: "lbl_default_settings".translate,
                  padding: EdgeInsets.all(16),
                  trailing: TextIcon(text: '', suffix: Icon(Icons.arrow_forward_ios_outlined, size: 12), textStyle: secondaryTextStyle()),
                ),
                if (appStore.isLoggedIn && !appStore.isSocialLogin)
                  SettingItemWidget(
                    splashColor: themePrimaryColor,
                    leading: Icon(Icons.password),
                    title: "lbl_change_password".translate,
                    padding: EdgeInsets.all(16),
                    trailing: TextIcon(text: '', suffix: Icon(Icons.arrow_forward_ios_outlined, size: 12), textStyle: secondaryTextStyle()),
                    onTap: () {
                      if (appStore.isEmailLogin) {
                        ChangePasswordScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                      } else {
                        toast("lbl_you_can_not_change_password".translate);
                      }
                    },
                  ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  onTap: () {
                    CurrencySelectionScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                  leading: Icon(Icons.money),
                  padding: EdgeInsets.all(16),
                  title: "lbl_Currency".translate,
                  trailing: Observer(
                    builder: (_) => TextIcon(
                        text: "${appStore.mSelectedCurrency!.name.validate()} (${appStore.mSelectedCurrency!.symbol.validate()})",
                        suffix: Icon(Icons.arrow_forward_ios_outlined, size: 12),
                        textStyle: secondaryTextStyle()),
                  ),
                ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  leading: Icon(Icons.language_outlined),
                  title: "lbl_App_Language".translate,
                  onTap: () {
                    appLocalizations = AppLocalizations.of(context);
                    LanguageSelectionScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide).then((value) {
                      setState(() {});
                    });
                  },
                  padding: EdgeInsets.all(16),
                  trailing: TextIcon(text: selectedLanguageDataModel!.name.validate(), suffix: Icon(Icons.arrow_forward_ios_outlined, size: 12), textStyle: secondaryTextStyle()),
                ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  leading: Icon(Icons.star_border),
                  padding: EdgeInsets.all(16),
                  title: "lbl_Rate_us".translate,
                  onTap: () {
                    if (Platform.isAndroid) {
                      AppCommon.commonLaunchUrl(Urls.appShareURL);
                    } else {
                      AppCommon.commonLaunchUrl(appStoreBaseURL);
                    }
                  },
                ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  leading: Icon(Icons.share),
                  title: "lbl_Share".translate,
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    Share.share('Share ${AppConstant.appName} app\n\n${Urls.appShareURL}');
                  },
                ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  leading: Icon(Icons.insert_drive_file),
                  title: "lbl_Terms_and_condition".translate,
                  padding: EdgeInsets.all(16),
                  onTap: () {
                    AppCommon.commonLaunchUrl(Urls.termsAndConditionURL, launchMode: LaunchMode.inAppWebView);
                  },
                ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  leading: Icon(Icons.person_outline),
                  title: "lbl_About_us".translate,
                  padding: EdgeInsets.all(16),
                  trailing: TextIcon(text: '', suffix: Icon(Icons.arrow_forward_ios_outlined, size: 12), textStyle: secondaryTextStyle()),
                  onTap: () {
                    AboutUsScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                ),
                SettingItemWidget(
                  splashColor: themePrimaryColor,
                  leading: Icon(Icons.logout),
                  title: "lbl_logout".translate,
                  padding: EdgeInsets.all(16),
                  trailing: TextIcon(text: '', suffix: Icon(Icons.arrow_forward_ios_outlined, size: 12), textStyle: secondaryTextStyle()),
                  onTap: () {
                    showConfirmDialogCustom(
                      context,
                      dialogType: DialogType.CONFIRMATION,
                      primaryColor: themePrimaryColor,
                      title: "lbl_are_you_sure_logout".translate,
                      onAccept: (c) {
                        setState(() {
                          authService.logout(context);
                        });
                      },
                    );
                  },
                ).visible(appStore.isLoggedIn),
              ],
            ).paddingBottom(30),
          ),
        ),
      ),
    );
  }
}
