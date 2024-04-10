import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/model/coin_sorting_model.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/utils/app_functions.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/linear_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class ExchangeScreen extends StatefulWidget {
  List<Ticker> ticker;

  ExchangeScreen({required this.ticker});

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  BannerAd? myBanner;
  int selectedValue = 0;
  SortingTypeModel selectedTypeValue = SortingTypeModel(id: 0, name: "BTC", value: "btc");

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    myBanner = buildBannerAd()..load();
    log("myBanner myBanner myBanner $myBanner");
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('lbl_exchanges'.translate, style: boldTextStyle(size: 22)),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                children: [
                  Row(
                    children: List.generate(SortingTypeModel.getExchangesSortValue.length, (index) {
                      SortingTypeModel data = SortingTypeModel.getExchangesSortValue[index];
                      return RadioListTile(
                        groupValue: selectedValue,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: data.id.validate(),
                        onChanged: (value) {
                          selectedValue = value!.toString().toInt();
                          selectedTypeValue = data;
                          setState(() {});
                        },
                        title: Text('${data.name.validate()}', style: primaryTextStyle()),
                      ).expand();
                    }),
                  ),
                  16.height,
                  Table(
                    children: [
                      TableRow(decoration: BoxDecoration(color: themePrimaryColor.withOpacity(0.2)), children: [
                        Container(padding: EdgeInsets.all(10), child: Text("lbl_exch".translate, textAlign: TextAlign.right, style: boldTextStyle()).center()),
                        Container(padding: EdgeInsets.all(10), child: Text("lbl_pair".translate, textAlign: TextAlign.right, style: boldTextStyle()).center()),
                        Container(padding: EdgeInsets.all(10), child: Text('lbl_price'.translate.capitalizeFirstLetter(), textAlign: TextAlign.right, style: boldTextStyle())),
                        Container(padding: EdgeInsets.all(10), child: Text('lbl_24H_volume'.translate, textAlign: TextAlign.right, style: boldTextStyle())),
                      ]),
                    ],
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.ticker.length,
                    itemBuilder: (context, index) {
                      Ticker data = widget.ticker[index];
                      return Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${data.market!.name.validate()}', style: primaryTextStyle(size: 14)),
                                4.height,
                                LinearProgressWidget(value: 10, selectedColor: data.trust_score?.getExchangeColor).center(),
                              ],
                            ).expand(),
                            Text('${data.base.validate()}\n${data.target.validate()}', style: primaryTextStyle(size: 14), textAlign: TextAlign.center).expand(),
                            Text('${getCurrencyPrefix(selectedValue)}${getExchangeFrom(selectedTypeValue, data.converted_last!).validate().amountPrefix}',
                                    style: primaryTextStyle(size: 14), textAlign: TextAlign.right)
                                .expand(),
                            Text('${getCurrencyPrefix(selectedValue)}${getExchangeFrom(selectedTypeValue, data.converted_volume!).validate().amountPrefix}',
                                    style: primaryTextStyle(size: 14), textAlign: TextAlign.right)
                                .expand(),
                          ],
                        ),
                      ).onTap(() {
                        showMoreDetail(context, data);
                      });
                    },
                  ),
                ],
              ),
            ),
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
