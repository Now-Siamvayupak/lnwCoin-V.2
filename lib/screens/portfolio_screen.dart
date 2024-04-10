import 'package:async/async.dart';
import 'package:lnwcoin/component/common_error_builder.dart';
import 'package:lnwcoin/component/main_portfolio_component.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/portfolio_coins_model.dart';
import 'package:lnwcoin/model/portfolio_model.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/widgets/NoPortfolioWidget.dart';
import 'package:lnwcoin/widgets/app_scaffold.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/loader_widget.dart';
import 'add_coin_to_portfolio.dart';

class PortFolioScreen extends StatefulWidget {
  static String tag = '/PortFolioScreen';

  @override
  PortFolioScreenState createState() => PortFolioScreenState();
}

class PortFolioScreenState extends State<PortFolioScreen> {
  AsyncMemoizer asyncMemoizer = AsyncMemoizer();
  String data = "";
  num coinValue = 0.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('lbl_your_portfolio'.translate, style: boldTextStyle(size: 22)),
      ),
      body: Container(
        width: context.width(),
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
            LiveStream().emit("UpdatePortfolioData", true);
          },
          child: StreamBuilder<List<PortfolioModel>>(
            stream: portfolioService.getPortfolioList(),
            builder: (context, streamSnap) {
              if (streamSnap.hasData) {
                data = "";
                streamSnap.data!.forEach((element) {
                  data += "${element.coinId.validate()},";
                });
                LiveStream().emit("UpdatePortfolioData", true);

                return FutureBuilder<Map<String, dynamic>>(
                  future: PortfolioApi.getPortfolioData(coinIds: data, currency: appStore.mSelectedCurrency!.cc.validate()),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      LiveStream().emit("UpdatePortfolioData", true);
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            MainPortfolioComponent(data: streamSnap.data!, liveData: snap.data!).paddingAll(16),
                            8.height,
                            16.height.visible(streamSnap.data!.isEmpty),
                            streamSnap.data!.isEmpty
                                ? Container(
                                    child: NoPortfolioWidget(),
                                    height: context.height() * 0.6,
                                  )
                                : ListView.builder(
                                    itemCount: streamSnap.data!.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(left: 16, right: 16),
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      PortfolioModel data = streamSnap.data![index];
                                      Data currentValuation = Data();
                                      if (snap.data?[data.coinId.validate()] != null) {
                                        currentValuation = Data.fromJson(snap.data?[data.coinId.validate()]);
                                      }
                                      data.currentCurrencyList!.forEach((element) {
                                        if (element['currency'] == appStore.mSelectedCurrency!.cc) {
                                          coinValue = element['currentValue'];
                                        }
                                      });
                                      LiveStream().emit("UpdatePortfolioData", true);
                                      return InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onTap: () {
                                          getSelectedDetailScreen(
                                            name: data.name.validate(),
                                            id: data.coinId.validate(),
                                            image: data.coinIcon.validate(),
                                          ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                                        },
                                        child: Container(
                                          decoration: boxDecorationDefault(borderRadius: radius(20), color: context.cardColor),
                                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  cachedImage(data.coinIcon, width: 50, height: 50, fit: BoxFit.fill).cornerRadiusWithClipRRect(100),
                                                  8.width,
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(data.coinSymbol.validate(), style: primaryTextStyle(), textAlign: TextAlign.center),
                                                      4.height,
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("${appStore.mSelectedCurrency?.symbol.validate()}${(data.noOfUnits.validate() * currentValuation.inr.validate()).amountPrefix}",
                                                                  style: boldTextStyle(), maxLines: 2, softWrap: true)
                                                              .flexible(flex: 1),
                                                          Text('(${currentValuation.inr_24h_change.validate().toStringAsFixed(2)} %)',
                                                              style: primaryTextStyle(color: currentValuation.inr_24h_change.validate().getAmountForColor, size: 14))
                                                        ],
                                                      ),
                                                    ],
                                                  ).expand(),
                                                  IconButton(
                                                    icon: Icon(Icons.delete, size: 24, color: Colors.red),
                                                    onPressed: () {
                                                      showConfirmDialogCustom(
                                                        context,
                                                        dialogType: DialogType.DELETE,
                                                        onAccept: (s) {
                                                          appStore.setLoading(true);
                                                          portfolioService
                                                              .removeDocument(data.uid.validate())
                                                              .then(
                                                                (value) => () {
                                                                  LiveStream().emit("UpdatePortfolioData", true);
                                                                  toast("lblRemoved".translate);
                                                                  setState(() {});
                                                                },
                                                              )
                                                              .whenComplete(
                                                                () => appStore.setLoading(false),
                                                              );
                                                        },
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                              16.height,
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text('lbl_current_value'.translate, style: secondaryTextStyle(size: 12), textAlign: TextAlign.end),
                                                      4.height,
                                                      Text(
                                                        "${appStore.mSelectedCurrency!.symbol.validate()}${currentValuation.inr.validate().toString()}",
                                                        style: boldTextStyle(size: 18),
                                                        textAlign: TextAlign.end,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ],
                                                  ).expand(flex: 1),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text('lbl_avg_price'.translate, style: secondaryTextStyle(size: 12), textAlign: TextAlign.end),
                                                      4.height,
                                                      Text("${appStore.mSelectedCurrency!.symbol.validate()}$coinValue",
                                                          style: boldTextStyle(size: 18), textAlign: TextAlign.end, maxLines: 1, overflow: TextOverflow.ellipsis),
                                                    ],
                                                  ).expand(flex: 1),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text("lbl_quantity".translate, style: secondaryTextStyle(size: 12), textAlign: TextAlign.end),
                                                      4.height,
                                                      Text('${data.noOfUnits.validate().toInt()}', style: boldTextStyle(size: 18))
                                                    ],
                                                  ).expand(flex: 1),
                                                ],
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: ReadMoreText(
                                                  "${data.notes.validate()}",
                                                  style: secondaryTextStyle(),
                                                  trimLines: 2,
                                                  colorClickableText: Colors.white,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText: 'lbl_show_more'.translate,
                                                  trimExpandedText: 'lbl_show_less'.translate,
                                                ).paddingTop(16).visible(data.notes!.isNotEmpty),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ).paddingBottom(16);
                                    },
                                  ),
                          ],
                        ),
                      );
                    }
                    return snapWidgetHelper(
                      snap,
                      loadingWidget: LoaderWidget(),
                      errorBuilder: (p0) => CommonErrorBuilder(text: p0),
                    );
                  },
                );
              }
              return snapWidgetHelper(
                streamSnap,
                errorBuilder: (p0) => CommonErrorBuilder(text: p0),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddCoinToPortfolio().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
        },
        child: Observer(builder: (_) => Icon(Icons.add, color: appStore.isDarkMode ? Colors.white : Colors.black)),
      ).visible(!isCurrentlyOnNoInternet),
    );
  }
}
