import 'package:lnwcoin/model/price_model.dart';
import 'package:lnwcoin/model/search_model.dart';
import 'package:lnwcoin/network/local_db/sqflite_methods.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/screens/add_crypto_screen.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/utils/app_functions.dart';
import 'package:lnwcoin/widgets/favourite_gridview_widget.dart';
import 'package:lnwcoin/widgets/favourite_listview_widget.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../widgets/app_scaffold.dart';

class FavoriteCoinComponent extends StatefulWidget {
  @override
  _FavoriteCoinComponentState createState() => _FavoriteCoinComponentState();
}

class _FavoriteCoinComponentState extends State<FavoriteCoinComponent> {
  BannerAd? myBanner;
  List<String> favoriteIdList = [];

  int? crossAxisCount;
  int? fitWithCount;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    myBanner = buildBannerAd()..load();
    fitWithCount = getIntAsync(FIT_COUNT, defaultValue: 1);
    crossAxisCount = getIntAsync(CROSS_COUNT, defaultValue: 2);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget gridView() {
    return Container(
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        appBar: AppBar(
          title: Text('lbl_favorite_coins'.translate, style: boldTextStyle(size: 22)),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                await AddCryptoScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide).then((value) {
                  setState(() {});
                });
              },
            ),
            IconButton(
              icon: getLayoutTypeIcon(),
              onPressed: () async {
                String type = getStringAsync(SELECTED_LAYOUT_TYPE_FAVOURITE, defaultValue: LIST_VIEW);
                if (type == LIST_VIEW) {
                  await setValue(SELECTED_LAYOUT_TYPE_FAVOURITE, GRID_VIEW);
                  setState(() {});
                } else {
                  await setValue(SELECTED_LAYOUT_TYPE_FAVOURITE, LIST_VIEW);
                  setState(() {});
                }
              },
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            SnapHelperWidget<List<Coin>>(
              future: SqliteMethods.getFavoriteCoins(),
              onSuccess: (snap) {
                favoriteIdList.clear();
                appStore.favCoinList.clear();
                snap.forEach((element) {
                  favoriteIdList.add(element.id.toString());
                  appStore.favCoinList.add(element.id!);
                  favoriteIdList.join(',');
                });
                String favId = favoriteIdList.join(',');

                if (snap.length == 0) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${'lbl_you_have_no_favourites'.translate} :(", style: boldTextStyle()).center(),
                    ],
                  );
                }
                return FutureBuilder<Map<String, dynamic>>(
                    future: getPriceInfo(favouriteId: favId, currency: appStore.mSelectedCurrency!.cc.validate()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        String type = getStringAsync(SELECTED_LAYOUT_TYPE_FAVOURITE, defaultValue: LIST_VIEW);
                        if (type == GRID_VIEW) {
                          return SingleChildScrollView(
                            child: Wrap(
                              runSpacing: 16,
                              spacing: 16,
                              children: snap.map((e) {
                                Coin data = snap[snap.indexOf(e)];

                                if (snapshot.data![data.id.validate()] != null) {
                                  Bitcoin value = Bitcoin.fromJson(snapshot.data![data.id.validate()]);

                                  return FavouriteGridviewWidget(
                                    data: value,
                                    coinData: data,
                                    onUpdate: () {
                                      setState(() {});
                                    },
                                  ).onTap(
                                    () {
                                      getSelectedDetailScreen(
                                        name: data.name.validate(),
                                        id: data.id.validate(),
                                        image: data.large.validate(),
                                      ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                                    },
                                    borderRadius: radius(20),
                                  );
                                } else {
                                  return Offstage();
                                }
                              }).toList(),
                            ).paddingSymmetric(horizontal: 8, vertical: 8),
                          );
                        } else {
                          return ListView.builder(
                              physics: ClampingScrollPhysics(),
                              padding: EdgeInsets.all(0),
                              itemCount: snap.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                Coin data = snap[index];
                                100.milliseconds.delay;

                                if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                                  Bitcoin? value = Bitcoin.fromJson(snapshot.data![data.id.validate()]);
                                  return FavouriteListViewWidget(
                                    data: value,
                                    coinData: data,
                                    onUpdate: () {
                                      setState(() {});
                                    },
                                  ).onTap(
                                    () {
                                      getSelectedDetailScreen(
                                        name: data.name.validate(),
                                        id: data.id.validate(),
                                        image: data.large.validate(),
                                      ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                                    },
                                    borderRadius: radius(20),
                                  ).paddingOnly(top: 16);
                                }

                                return Offstage();
                              }).paddingSymmetric(horizontal: 16);
                        }
                      }
                      return LoaderWidget();
                    });
              },
            ).paddingBottom(60),
            Positioned(
              child: AdWidget(ad: myBanner!),
              bottom: 0,
              left: 0,
              right: 0,
              height: AdSize.banner.height.toDouble(),
            ).visible(myBanner != null && AppConstant.isAdsLoading),
          ],
        ),
      ),
    );
  }
}
