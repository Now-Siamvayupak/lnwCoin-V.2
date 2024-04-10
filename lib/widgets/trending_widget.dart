import 'package:async/async.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/coin_detail_model.dart';
import 'package:lnwcoin/model/trending_model.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/get_detail_view_currency.dart';
import 'package:lnwcoin/widgets/cached_network_image.dart';
import 'package:lnwcoin/widgets/increment_decrement_widget.dart';
import 'package:lnwcoin/widgets/shimmer_trending_widget1.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class TrendingWidget extends StatefulWidget {
  Item trendingItemData;

  TrendingWidget({required this.trendingItemData});

  @override
  _TrendingWidgetState createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
  AsyncMemoizer<CoinDetailModel> asyncMemoizer = AsyncMemoizer();

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return SnapHelperWidget<CoinDetailModel>(
      loadingWidget: ShimmerTrendingWidget1(),
      future: asyncMemoizer.runOnce(() => getCoinDetail(name: widget.trendingItemData.id.validate())),
      onSuccess: (data) {
        return Container(
          width: 190,
          padding: EdgeInsets.all(16),
          decoration: boxDecorationDefault(borderRadius: radius(20), color: context.cardColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  cachedImage(widget.trendingItemData.large.validate(), height: 30).cornerRadiusWithClipRRect(80),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Marquee(
                        child: Text(widget.trendingItemData.name.validate(), style: boldTextStyle(size: 14), maxLines: 1),
                        textDirection: TextDirection.ltr,
                      ),
                      Text(widget.trendingItemData.symbol.validate(), style: secondaryTextStyle(size: 14), maxLines: 1),
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
                  )
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
                fallbackHeight: 30,
                fallbackWidth: 160,
              ),
              8.height,
              TextIcon(
                prefix: IncrementDecrementWidget(
                  isDecrease: getPercentageValueInCurrency(data.market_data!.price_change_percentage_1h_in_currency!).validate().isNegative,
                ),
                spacing: 4,
                text: "${getPercentageValueInCurrency(data.market_data!.price_change_percentage_1h_in_currency!).validate()} %",
              ),
              4.height,
              Container(
                height: 3,
                width: 3,
                decoration: boxDecorationWithShadow(boxShape: BoxShape.circle),
              ),
              4.height,
              TextIcon(
                prefix: Text('', style: primaryTextStyle()),
                spacing: 6,
                textStyle: primaryTextStyle(),
                text: '${appStore.mSelectedCurrency!.symbol.validate()}${getPercentageValueInCurrency(data.market_data!.current_price!).validate()} ',
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
