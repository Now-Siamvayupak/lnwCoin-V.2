import 'package:lnwcoin/model/companies_model.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'increment_decrement_widget.dart';

class CompaniesWidget extends StatefulWidget {
  static String tag = '/CompaniesWidget';

  final Company? companiesData;

  CompaniesWidget({this.companiesData});

  @override
  CompaniesWidgetState createState() => CompaniesWidgetState();
}

class CompaniesWidgetState extends State<CompaniesWidget> {
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
    return Container(
      width: context.width(),
      padding: EdgeInsets.all(16),
      decoration: boxDecorationDefault(color: context.cardColor, borderRadius: radius(8)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Marquee(
                    direction: Axis.horizontal,
                    directionMarguee: DirectionMarguee.oneDirection,
                    child: Text(
                      widget.companiesData!.name.validate(),
                      style: boldTextStyle(),
                    ),
                  ),
                  8.height,
                  Text(widget.companiesData!.symbol.validate().toUpperCase(), style: secondaryTextStyle()),
                ],
              ).expand(),
              16.width,
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IncrementDecrementWidget(isDecrease: widget.companiesData!.percentage_of_total_supply.validate().isNegative, size: 12),
                      6.width,
                      Text(
                        '${widget.companiesData!.percentage_of_total_supply.validate().toStringAsFixed(2)}%',
                        style: secondaryTextStyle(color: widget.companiesData!.percentage_of_total_supply.validate().getAmountForColor),
                      )
                    ],
                  ),
                  8.height,
                  Text("${appStore.mSelectedCurrency?.symbol.validate()}${widget.companiesData!.total_holdings.validate().amountPrefix}", style: boldTextStyle()),
                  8.height,
                  Text(widget.companiesData!.country.validate().toUpperCase(), style: secondaryTextStyle()),
                ],
              ),
            ],
          ),
          16.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("lbl_total_entry_value".translate, style: secondaryTextStyle()),
                  4.height,
                  Text("${appStore.mSelectedCurrency?.symbol.validate()}${widget.companiesData!.total_entry_value_usd.validate().amountPrefix}", style: boldTextStyle()),
                ],
              ).expand(),
              4.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("lbl_current_value".translate, style: secondaryTextStyle()),
                  4.height,
                  Text("${appStore.mSelectedCurrency?.symbol.validate()}${widget.companiesData!.total_current_value_usd.validate().amountPrefix}", style: boldTextStyle()),
                ],
              ).expand(),
            ],
          )
        ],
      ),
    );
  }
}
