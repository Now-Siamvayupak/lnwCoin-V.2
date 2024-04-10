import 'package:lnwcoin/model/portfolio_coins_model.dart';
import 'package:lnwcoin/model/portfolio_model.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class MainPortfolioComponent extends StatefulWidget {
  final List<PortfolioModel> data;

  final Map<String, dynamic> liveData;

  MainPortfolioComponent({required this.data, required this.liveData});

  @override
  _MainPortfolioComponentState createState() => _MainPortfolioComponentState();
}

class _MainPortfolioComponentState extends State<MainPortfolioComponent> {
  num totalValue = 0.0;
  num investedValue = 0.0;
  num coinValue = 0.0;
  num totalGainLoss = 0.0;
  bool isGain = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    getTotalValue(widget.data, widget.liveData);

    LiveStream().on("UpdatePortfolioData", (p0) {
      if (p0 == true) {
        getTotalValue(widget.data, widget.liveData);
      }
    });
  }

  getTotalValue(List<PortfolioModel>? data, Map<String, dynamic> liveData) async {
    await 100.milliseconds.delay;
    totalValue = 0.0;
    investedValue = 0.0;
    data!.forEach((element) {
      Data currentValuation = Data.fromJson(liveData[element.coinId.validate()]);
      totalValue += (element.noOfUnits.validate() * currentValuation.inr.validate());
      element.currentCurrencyList!.forEach((element) {
        if (element['currency'] == appStore.mSelectedCurrency!.cc) {
          coinValue = element['currentValue'];
        }
      });
      investedValue += (element.noOfUnits.validate() * element.perCoin.validate());
    });

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: themePrimaryColor, borderRadius: radius()),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              Text('lbl_invested_value'.translate, style: primaryTextStyle(size: 14, color: Colors.white), textAlign: TextAlign.center),
              8.height,
              Text('${appStore.mSelectedCurrency!.symbol.validate()}${investedValue.toStringAsFixed(2)}', style: boldTextStyle(color: Colors.white), textAlign: TextAlign.center),
            ],
          ).expand(flex: 1),
          4.width,
          Container(height: 50, width: 2, color: Colors.white),
          4.width,
          Column(
            children: [
              Text('lbl_current_value'.translate, style: primaryTextStyle(size: 14, color: Colors.white), textAlign: TextAlign.center),
              8.height,
              Text('${appStore.mSelectedCurrency!.symbol.validate()}${totalValue.toStringAsFixed(2)}', style: boldTextStyle(color: Colors.white), textAlign: TextAlign.center),
            ],
          ).expand(flex: 1),
          4.width,
          Container(height: 50, width: 2, color: Colors.white),
          4.width,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('lbl_total_gain_loss'.translate, style: primaryTextStyle(size: 14, color: Colors.white), textAlign: TextAlign.center),
              8.height,
              Text('${appStore.mSelectedCurrency!.symbol.validate()}${(totalValue - investedValue).toStringAsFixed(2)}', style: boldTextStyle(color: Colors.white), textAlign: TextAlign.center),
            ],
          ).expand(flex: 1),
        ],
      ),
    );
  }
}
