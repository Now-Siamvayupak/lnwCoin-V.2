import 'package:lnwcoin/component/market_type_component.dart';
import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/candel_chart_model.dart';
import 'package:lnwcoin/model/coin_chart_model.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/utils/app_common.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:lnwcoin/widgets/area_chart_widget.dart';
import 'package:lnwcoin/widgets/candle_chart_widget.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class MarketChartComponent extends StatefulWidget {
  String coinId;
  DashboardType dashboardType;

  MarketChartComponent({required this.coinId, this.dashboardType = DashboardType.DASHBOARD_1});

  @override
  _MarketChartComponentState createState() => _MarketChartComponentState();
}

class _MarketChartComponentState extends State<MarketChartComponent> {
  List<String> timeChart = ['1m', '1w', '1d', '3m', '1y'];
  int selected = 2;

  bool isCandleSelected = false;

  ChartMarketType selectedChartMarketType = ChartMarketType.PRICES;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    isCandleSelected = getIntAsync(SharedPreferenceKeys.CHART_SELECTED_INDEX, defaultValue: 0) != 0;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedCrossFade(
          firstChild: MarketTypeComponent(),
          secondCurve: Curves.fastOutSlowIn,
          secondChild: chartAttributes(),
          crossFadeState: isCandleSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: 300.milliseconds,
        ),
        16.height,
        AnimatedCrossFade(
          firstChild: areaChart(),
          secondChild: candleChart(),
          firstCurve: Curves.easeIn,
          secondCurve: Curves.easeInBack,
          crossFadeState: isCandleSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: 300.milliseconds,
        ),
        16.height,
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(timeChart.length, (index) {
                bool isSelected = selected == index;
                return Observer(
                  builder: (_) => AnimatedContainer(
                    width: 56,
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationDefault(
                      gradient: LinearGradient(
                        colors: <Color>[
                          isSelected ? appStore.mSelectedGraphColor.withOpacity(0.5) : context.cardColor,
                          isSelected ? appStore.mSelectedGraphColor : context.cardColor,
                        ],
                        stops: <double>[0.03, 0.9],
                        end: Alignment.centerLeft,
                        begin: Alignment.centerRight,
                      ),
                      color: appStore.mSelectedGraphColor.withOpacity(0.5),
                      border: isSelected ? Border.all(color: context.dividerColor) : null,
                    ),
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeIn,
                    child: Text(timeChart[index], style: primaryTextStyle()).center(),
                  ).onTap(() {
                    selected = index;
                    chartStore.setIsDateSelected(false);

                    if (index == 0) {
                      chartStore.setRangeDifference(30);
                    } else if (index == 1) {
                      chartStore.setRangeDifference(7);
                    } else if (index == 2) {
                      chartStore.setRangeDifference(1);
                    } else if (index == 3) {
                      chartStore.setRangeDifference(90);
                    } else if (index == 4) {
                      chartStore.setRangeDifference(180);
                    } else if (index == 5) {
                      chartStore.setRangeDifference(365);
                    }
                    setState(() {});
                  }, borderRadius: radius()),
                );
              }),
            ).expand(),
            Align(
              alignment: Alignment.centerRight,
              child: AnimatedContainer(
                padding: EdgeInsets.only(right: 16),
                duration: 600.milliseconds,
                child: isCandleSelected ? AppImages.line_chart.assetImage(fit: BoxFit.fill) : AppImages.candlestick.assetImage(fit: BoxFit.fill),
              ),
            ).onTap(() {
              isCandleSelected = !isCandleSelected;
              setState(() {});
            }),
          ],
        ),
      ],
    );
  }

  Widget dashboardType2() {
    return Column(
      children: [
        8.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(timeChart.length, (index) {
            bool isSelected = selected == index;
            return Observer(
              builder: (_) => AnimatedContainer(
                width: 56,
                padding: EdgeInsets.all(8),
                decoration: boxDecorationDefault(
                  gradient: LinearGradient(
                    colors: <Color>[
                      isSelected ? appStore.mSelectedGraphColor.withOpacity(0.5) : context.cardColor,
                      isSelected ? appStore.mSelectedGraphColor : context.cardColor,
                    ],
                    stops: <double>[0.03, 0.9],
                    end: Alignment.centerLeft,
                    begin: Alignment.centerRight,
                  ),
                  color: appStore.mSelectedGraphColor.withOpacity(0.5),
                  border: isSelected ? Border.all(color: context.dividerColor, width: 3) : null,
                ),
                duration: Duration(milliseconds: 600),
                curve: Curves.easeIn,
                child: Text(timeChart[index], style: primaryTextStyle()).center(),
              ).onTap(() {
                selected = index;
                chartStore.setIsDateSelected(false);

                if (index == 0) {
                  chartStore.setRangeDifference(30);
                } else if (index == 1) {
                  chartStore.setRangeDifference(7);
                } else if (index == 2) {
                  chartStore.setRangeDifference(1);
                } else if (index == 3) {
                  chartStore.setRangeDifference(90);
                } else if (index == 4) {
                  chartStore.setRangeDifference(180);
                } else if (index == 5) {
                  chartStore.setRangeDifference(365);
                }
                setState(() {});
              }, borderRadius: radius()),
            );
          }),
        ),
        16.height,
        AnimatedCrossFade(
          firstChild: areaChart(),
          secondChild: candleChart(),
          firstCurve: Curves.easeIn,
          secondCurve: Curves.easeInBack,
          crossFadeState: isCandleSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: 300.milliseconds,
        ),
        16.height,
        Row(
          children: [
            AnimatedCrossFade(
              firstChild: MarketTypeComponent(dashboardType: getSelectedDashboard),
              secondCurve: Curves.fastOutSlowIn,
              secondChild: chartAttributes(),
              crossFadeState: isCandleSelected ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: 300.milliseconds,
            ).expand(),
            Align(
              alignment: Alignment.centerRight,
              child: AnimatedContainer(
                padding: EdgeInsets.only(right: 16),
                duration: 600.milliseconds,
                child: isCandleSelected ? AppImages.line_chart.assetImage(fit: BoxFit.fill) : AppImages.candlestick.assetImage(fit: BoxFit.fill),
              ),
            ).onTap(() {
              isCandleSelected = !isCandleSelected;
              setState(() {});
            })
          ],
        ),
      ],
    );
  }

  Widget areaChart() {
    return Observer(
      builder: (_) => SnapHelperWidget<CoinChartModel>(
        loadingWidget: LoaderWidget(
          size: 150,
        ).withHeight(280),
        future: getCoinMarket(name: widget.coinId, timeLimit: chartStore.mRangeDifference, currency: appStore.mSelectedCurrency!.cc.validate()),
        onSuccess: (data) {
          return Observer(
            builder: (_) => AreaChartWidget(
              coinChart: data,
              graphColor: appStore.mSelectedGraphColor,
              selectedChartType: chartStore.mSelectedChartMarketType,
            ),
          );
        },
      ),
    );
  }

  Widget candleChart() {
    return Observer(
      builder: (_) => SnapHelperWidget<List<CandleChartResponse>>(
        loadingWidget: LoaderWidget(
          size: 150,
        ).withHeight(280),
        future: ChartApi.getOLHCChart(coinId: widget.coinId, days: chartStore.mRangeDifference, currency: appStore.mSelectedCurrency!.cc.validate()),
        onSuccess: (snap) {
          return Observer(
            builder: (_) => CandleChartWidget(
              coinChart: snap,
              graphColor: appStore.mSelectedGraphColor,
              selectedChartType: chartStore.mSelectedChartMarketType,
            ),
          );
        },
      ),
    );
  }

  Widget chartAttributes() {
    return Row(
      children: List.generate(1, (index) {
        return Row(
          children: [
            Radio<int>(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: 1,
                groupValue: 1,
                onChanged: (value) {
                  //
                }),
            Text(appStore.mSelectedCurrency!.cc.validate().toUpperCase(), style: primaryTextStyle()),
          ],
        );
      }),
    );
  }
}
