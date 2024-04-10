import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_list_model.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:lnwcoin/widgets/increment_decrement_widget.dart';
import 'package:lnwcoin/widgets/stats_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

// ignore: must_be_immutable
class CoinDialogWidget extends StatelessWidget {
  CoinListModel coinData;
  bool isFromDashboard;

  CoinDialogWidget({required this.coinData, this.isFromDashboard = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              cachedImage(coinData.image.validate(), height: 40, width: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(80),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${coinData.name.validate()}', style: boldTextStyle()),
                  2.height,
                  Text(coinData.symbol.validate().toUpperCase(), style: secondaryTextStyle()),
                ],
              ).expand(),
              isFromDashboard
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IncrementDecrementWidget(isDecrease: coinData.price_change_percentage_1h_in_currency.validate().isNegative, size: 12),
                        6.width,
                        Text(
                          '${coinData.price_change_percentage_1h_in_currency.validate().toStringAsFixed(2)}%',
                          style: secondaryTextStyle(color: coinData.price_change_percentage_1h_in_currency.validate().getAmountForColor),
                        )
                      ],
                    )
                  : Observer(
                      builder: (_) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IncrementDecrementWidget(isDecrease: getInterval(coinData, coinStore.selectedIntervalType!).isNegative, size: 12),
                          6.width,
                          Text(
                            '${getInterval(coinData, coinStore.selectedIntervalType!).toStringAsFixed(2)}%',
                            style: secondaryTextStyle(color: getInterval(coinData, coinStore.selectedIntervalType!).getAmountForColor),
                          )
                        ],
                      ),
                    ),
            ],
          ),
          32.height,
          SfSparkLineChart(
            axisLineWidth: 0,
            data: coinData.sparkline_in_7d?.price,
            width: 1,
            color: isFromDashboard ? coinData.price_change_percentage_1h_in_currency.validate().getAmountForColor : getInterval(coinData, coinStore.selectedIntervalType!).getAmountForColor,
            trackball: SparkChartTrackball(
              backgroundColor: Colors.white.withOpacity(0.8),
              borderColor: Colors.white.withOpacity(0.8),
              borderWidth: 2,
              color: Colors.white,
              labelStyle: TextStyle(color: Colors.black),
              activationMode: SparkChartActivationMode.tap,
            ),
            marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.last),
          ),
          16.height,
          Align(alignment: Alignment.topRight, child: Text('last_seven_days'.translate, style: secondaryTextStyle())),
          32.height,
          StatsDetailWidget(title: 'lbl_market_cap_rank'.translate, value: '#${coinData.market_cap_rank}'),
          StatsDetailWidget(title: 'lbl_market_cap'.translate.capitalizeFirstLetter(), value: '${coinData.market_cap.validate().amountPrefix}'),
          StatsDetailWidget(title: 'lbl_fully_diluted_valuation'.translate, value: '${coinData.fully_diluted_valuation.validate().amountPrefix}'),
          StatsDetailWidget(title: 'lbl_trading_volume'.translate, value: '${coinData.total_volume.validate().amountPrefix}'),
          StatsDetailWidget(title: 'lbl_24_High'.translate, value: '${coinData.high_24h.validate().amountPrefix}'),
          StatsDetailWidget(title: 'lbl_24_low'.translate, value: '${coinData.low_24h.validate().amountPrefix}'),
          StatsDetailWidget(title: 'lbl_available_supply'.translate, value: '${coinData.circulating_supply.validate().amountPrefix}'),
          StatsDetailWidget(title: 'lbl_total_supply'.translate, value: '${coinData.total_supply.validate().amountPrefix}'),
          StatsDetailWidget(title: 'lbl_all_time_high'.translate, value: '${coinData.ath.validate().amountPrefix}'),
          StatsDetailWidget(title: 'lbl_since_all_time_high'.translate, value: '${coinData.ath_change_percentage}'),
          StatsDetailWidget(title: 'lbl_all_time_low'.translate, value: '${coinData.atl.validate().amountPrefix}'),
          StatsDetailWidget(title: 'lbl_since_all_time_low'.translate, value: '${coinData.atl_change_percentage}'),
        ],
      ),
    );
  }
}
