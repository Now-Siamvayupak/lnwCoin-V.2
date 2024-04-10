import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/metrics_widget.dart';
import 'package:lnwcoin/widgets/new_metrics_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class KeyMetricsComponent extends StatefulWidget {
  MarketData marketData;
  DashboardType dashboardType;

  KeyMetricsComponent({required this.marketData, this.dashboardType = DashboardType.DASHBOARD_1});

  @override
  _KeyMetricsComponentState createState() => _KeyMetricsComponentState();
}

class _KeyMetricsComponentState extends State<KeyMetricsComponent> {
  bool isList = false;

  @override
  Widget build(BuildContext context) {
    switch (widget.dashboardType) {
      case DashboardType.DASHBOARD_1:
        return dashboardType1();
      case DashboardType.DASHBOARD_2:
        return dashboardType2();
    }
  }

  Widget dashboardType1() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Observer(
            builder: (_) {
              return Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(width: 1.5, color: appStore.mSelectedGraphColor.withOpacity(0.5)),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: appStore.mSelectedGraphColor.withOpacity(0.3),
                    ),
                    children: [
                      Text('24H', style: boldTextStyle()).paddingAll(8).center(),
                      Text('7D', style: boldTextStyle()).paddingAll(8).center(),
                      Text('14D', style: boldTextStyle()).paddingAll(8).center(),
                      Text('30D', style: boldTextStyle()).paddingAll(8).center(),
                      Text('60D', style: boldTextStyle()).paddingAll(8).center(),
                      Text('1Y', style: boldTextStyle()).paddingAll(8).center(),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('${getPercentageValueInCurrency(widget.marketData.market_cap_change_percentage_24h_in_currency!).validate().toStringAsFixed(2)}',
                              style: boldTextStyle(color: getPercentageValueInCurrency(widget.marketData.market_cap_change_percentage_24h_in_currency!).validate().getAmountForColor))
                          .paddingAll(8)
                          .center(),
                      Text('${getPercentageValueInCurrency(widget.marketData.price_change_percentage_7d_in_currency!).validate().toStringAsFixed(2)}',
                              style: boldTextStyle(color: getPercentageValueInCurrency(widget.marketData.price_change_percentage_7d_in_currency!).validate().getAmountForColor))
                          .paddingAll(8)
                          .center(),
                      Text('${getPercentageValueInCurrency(widget.marketData.price_change_percentage_14d_in_currency!).validate().toStringAsFixed(2)}',
                              style: boldTextStyle(color: getPercentageValueInCurrency(widget.marketData.price_change_percentage_14d_in_currency!).validate().getAmountForColor))
                          .paddingAll(8)
                          .center(),
                      Text('${getPercentageValueInCurrency(widget.marketData.price_change_percentage_30d_in_currency!).validate().toStringAsFixed(2)}',
                              style: boldTextStyle(color: getPercentageValueInCurrency(widget.marketData.price_change_percentage_30d_in_currency!).validate().getAmountForColor))
                          .paddingAll(8)
                          .center(),
                      Text('${getPercentageValueInCurrency(widget.marketData.price_change_percentage_60d_in_currency!).validate().toStringAsFixed(2)}',
                              style: boldTextStyle(color: getPercentageValueInCurrency(widget.marketData.price_change_percentage_60d_in_currency!).validate().getAmountForColor))
                          .paddingAll(8)
                          .center(),
                      Text('${getPercentageValueInCurrency(widget.marketData.price_change_percentage_1y_in_currency!).validate().toStringAsFixed(2)}',
                              style: boldTextStyle(color: getPercentageValueInCurrency(widget.marketData.price_change_percentage_1y_in_currency!).validate().getAmountForColor))
                          .paddingAll(8)
                          .center(),
                    ],
                  ),
                ],
              );
            },
          ).paddingSymmetric(horizontal: 8),
          16.height,
          MetricsWidget(
            value: '# ${widget.marketData.market_cap_rank.validate()}',
            name: 'lbl_market_cap_rank'.translate,
            isCurrencyAllowed: false,
          ),
          MetricsWidget(
            value: '${getPercentageValueInCurrency(widget.marketData.market_cap!).validate().amountPrefix}',
            name: 'lbl_market_cap'.translate.capitalizeFirstLetter(),
          ),
          MetricsWidget(
            value: '${getPercentageValueInCurrency(widget.marketData.fully_diluted_valuation!).validate().amountPrefix}',
            name: 'lbl_fully_diluted_valuation'.translate,
          ),
          MetricsWidget(
            value: '${getPercentageValueInCurrency(widget.marketData.total_volume!).validate().amountPrefix}',
            name: 'lbl_trading_volume'.translate,
          ),
          MetricsWidget(
            value: '${getPercentageValueInCurrency(widget.marketData.high_24h!).validate().amountPrefix}',
            name: 'lbl_24_High'.translate,
          ),
          MetricsWidget(
            value: '${getPercentageValueInCurrency(widget.marketData.low_24h!).validate().amountPrefix}',
            name: 'lbl_24_low'.translate,
          ),
          MetricsWidget(
            value: '${widget.marketData.max_supply.validate().amountPrefix}',
            name: 'lbl_available_supply'.translate,
          ),
          MetricsWidget(
            value: '${widget.marketData.total_supply.validate().amountPrefix}',
            name: 'lbl_total_supply'.translate,
          ),
          MetricsWidget(
            value: '${getPercentageValueInCurrency(widget.marketData.ath!).validate().amountPrefix}',
            name: 'lbl_all_time_high'.translate,
          ),
          MetricsWidget(
            isCurrencyAllowed: false,
            value: '${getPercentageValueInCurrency(widget.marketData.ath_change_percentage!).validate()} %',
            name: 'lbl_since_all_time_high'.translate,
          ),
          MetricsWidget(
            isCurrencyAllowed: false,
            value: '${getDates(widget.marketData.ath_date!).validate().getFormattedDate}',
            name: 'lbl_all_time_high_date'.translate,
          ),
          MetricsWidget(
            value: '${getPercentageValueInCurrency(widget.marketData.atl!).validate().amountPrefix}',
            name: 'lbl_all_time_low'.translate,
          ),
          MetricsWidget(
            value: '${getPercentageValueInCurrency(widget.marketData.atl_change_percentage!).validate().toStringAsFixed(2)}%',
            name: 'lbl_since_all_time_low'.translate,
            isCurrencyAllowed: false,
          ),
          MetricsWidget(
            isCurrencyAllowed: false,
            value: '${getDates(widget.marketData.atl_date!).validate().getFormattedDate}',
            name: 'lbl_all_time_low_date'.translate,
          )
        ],
      ),
    );
  }

  Widget dashboardType2() {
    return Container(
      width: context.width(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('lbl_price_24h'.translate, style: primaryTextStyle(color: appStore.mSelectedGraphColor, size: 20)),
          16.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  NewMetricsWidget(
                    isCurrencyAllowed: true,
                    name: 'lbl_open'.translate,
                    value: '${getPercentageValueInCurrency(widget.marketData.current_price!).validate().amountPrefix}',
                  ),
                  NewMetricsWidget(
                    name: 'lbl_high'.translate.capitalizeFirstLetter(),
                    value: '${getPercentageValueInCurrency(widget.marketData.high_24h!).validate().amountPrefix}',
                  ),
                  NewMetricsWidget(
                    name: 'lbl_average'.translate,
                    value: '-',
                    isCurrencyAllowed: false,
                  ),
                ],
              ).expand(),
              VerticalDivider(color: context.dividerColor).withHeight(70),
              Column(
                children: [
                  NewMetricsWidget(
                    isCurrencyAllowed: false,
                    name: 'lbl_close'.translate,
                    value: '-',
                  ),
                  NewMetricsWidget(
                    name: 'lbl_low'.translate.capitalizeFirstLetter(),
                    value: '${getPercentageValueInCurrency(widget.marketData.low_24h!).validate().amountPrefix}',
                  ),
                  NewMetricsWidget(
                    isCurrencyAllowed: false,
                    name: 'lbl_change'.translate,
                    value: '${getPercentageValueInCurrency(widget.marketData.price_change_percentage_24h_in_currency!).validate().amountPrefix}',
                    color: getPercentageValueInCurrency(widget.marketData.price_change_percentage_24h_in_currency!).validate().getAmountForColor,
                  ),
                ],
              ).expand(),
            ],
          ),
          16.height,
          Text('lbl_market_stats'.translate, style: primaryTextStyle(color: appStore.mSelectedGraphColor, size: 20)),
          16.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  NewMetricsWidget(isCurrencyAllowed: false, name: 'lbl_rank'.translate, value: '# ${widget.marketData.market_cap_rank.validate()}'),
                  NewMetricsWidget(name: 'lbl_avl_supply'.translate, value: '${widget.marketData.max_supply.validate().amountPrefix}'),
                  NewMetricsWidget(name: 'lbl_trading_vol'.translate, value: '${getPercentageValueInCurrency(widget.marketData.total_volume!).validate().amountPrefix}'),
                  NewMetricsWidget(name: 'lbl_all_time_high'.translate, value: '${getPercentageValueInCurrency(widget.marketData.ath!).validate().amountPrefix}'),
                  NewMetricsWidget(name: 'lbl_all_time_low'.translate, value: '${getPercentageValueInCurrency(widget.marketData.atl!).validate().amountPrefix}'),
                ],
              ).expand(),
              VerticalDivider(color: context.dividerColor).withHeight(110),
              Column(
                children: [
                  NewMetricsWidget(name: 'lbl_mkt_cap'.translate, value: '${getPercentageValueInCurrency(widget.marketData.market_cap!).validate().amountPrefix}'),
                  NewMetricsWidget(name: 'lbl_tOT_supply'.translate, value: '${widget.marketData.total_supply.validate().amountPrefix}'),
                  NewMetricsWidget(name: "lbl_tOT_vol".translate, value: '${getPercentageValueInCurrency(widget.marketData.total_volume!).validate().amountPrefix}'),
                  NewMetricsWidget(isCurrencyAllowed: false, name: 'lbl_since_ath'.translate, value: '${getPercentageValueInCurrency(widget.marketData.ath_change_percentage!).validate()}%'),
                  NewMetricsWidget(
                      isCurrencyAllowed: false, name: 'lbl_since_atl'.translate, value: '${getPercentageValueInCurrency(widget.marketData.atl_change_percentage!).validate().toStringAsFixed(2)}%'),
                ],
              ).expand(),
            ],
          )
        ],
      ),
    );
  }
}
