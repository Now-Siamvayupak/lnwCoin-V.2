import 'package:async/async.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/model/trending_model.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/shimmer_trending2_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'cached_network_image.dart';
import 'increment_decrement_widget.dart';

// ignore: must_be_immutable
class TrendingWidget2 extends StatefulWidget {
  static String tag = '/TrendingWidget2';
  Item trendingItemData;

  TrendingWidget2({required this.trendingItemData});

  @override
  TrendingWidget2State createState() => TrendingWidget2State();
}

class TrendingWidget2State extends State<TrendingWidget2> {
  AsyncMemoizer<CoinDetailModel> asyncMemoizer = AsyncMemoizer();

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
    return SnapHelperWidget<CoinDetailModel>(
      loadingWidget: Shimmer2Widget(width: 280, height: 220),
      future: asyncMemoizer.runOnce(() => getCoinDetail(name: widget.trendingItemData.id.validate())),
      onSuccess: (data) {
        return Container(
          width: 280,
          padding: EdgeInsets.all(16),
          decoration: boxDecorationDefault(color: context.cardColor, borderRadius: radius(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cachedImage(widget.trendingItemData.large.validate(), height: 40).cornerRadiusWithClipRRect(80),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Marquee(
                        child: Text(widget.trendingItemData.name.validate(), style: boldTextStyle(size: 14), maxLines: 1),
                        textDirection: TextDirection.ltr,
                      ),
                      4.height,
                      Text(widget.trendingItemData.symbol.validate(), style: secondaryTextStyle(size: 14)),
                    ],
                  ).expand(),
                  8.width,
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getPercentageValueInCurrency(data.market_data!.price_change_percentage_1h_in_currency!).validate().getAmountForColor.withOpacity(0.2),
                    ),
                    child: IncrementDecrementWidget(
                      isDecrease: getPercentageValueInCurrency(data.market_data!.price_change_percentage_1h_in_currency!).validate().isNegative,
                    ),
                  ),
                ],
              ),
              16.height,
              Sparkline(
                data: data.market_data!.sparkline_7d!.price!,
                lineColor: getPercentageValueInCurrency(data.market_data!.price_change_percentage_1h_in_currency!).validate().getAmountForColor,
                // fillMode: FillMode.below,
                cubicSmoothingFactor: 1.0,
                useCubicSmoothing: true,
                sharpCorners: false,
                lineWidth: 0.5,
                fillGradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    getPercentageValueInCurrency(data.market_data!.price_change_percentage_1h_in_currency!).validate().getAmountForColor,
                    getPercentageValueInCurrency(data.market_data!.price_change_percentage_1h_in_currency!).validate().getAmountForColor
                  ],
                  stops: <double>[0.03, 0.9],
                ),
                fallbackHeight: 32,
                fallbackWidth: 40,
              ),
              16.height,
              Row(
                children: [
                  Row(
                    children: [
                      IncrementDecrementWidget(
                        isDecrease: getPercentageValueInCurrency(data.market_data!.price_change_percentage_1h_in_currency!).validate().isNegative,
                      ),
                      4.width,
                      Text("${getPercentageValueInCurrency(data.market_data!.price_change_percentage_1h_in_currency!).validate()} %",
                              style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis)
                          .expand(),
                    ],
                  ).expand(),
                  8.width,
                  Text('${getPercentageValueInCurrency(data.market_data!.current_price!).validate()}', style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis)
                ],
              ),
            ],
          ),
        ).onTap(
          () {
            getSelectedDetailScreen(
              id: widget.trendingItemData.id.validate(),
              name: widget.trendingItemData.name.validate(),
              image: widget.trendingItemData.large.validate(),
            ).launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
          },
          borderRadius: radius(20),
        );
      },
    );
  }
}
