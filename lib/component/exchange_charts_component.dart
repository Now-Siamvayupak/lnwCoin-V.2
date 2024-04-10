import 'package:lnwcoin/main.dart';
import 'package:lnwcoin/model/exchnages_response.dart';
import 'package:lnwcoin/network/rest_api.dart';
import 'package:lnwcoin/widgets/exchanges_chart_widget.dart';
import 'package:lnwcoin/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

class ExchangeChartComponent extends StatefulWidget {
  final ExchangesResponse? data;

  ExchangeChartComponent({this.data});

  @override
  _ExchangeChartComponentState createState() => _ExchangeChartComponentState();
}

class _ExchangeChartComponentState extends State<ExchangeChartComponent> {
  List<String> timeChart = ['1m', '1w', '1d', '3m', '1y'];
  int selected = 2;

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
    return Column(
      children: [
        Observer(
          builder: (_) => SnapHelperWidget<List>(
            loadingWidget: LoaderWidget(
              size: 150,
            ).withHeight(280),
            future: getExchangesChart(interval: chartStore.mExchangeRangeDifference, exchangeId: widget.data?.id.validate()),
            onSuccess: (snap) {
              return Observer(
                builder: (_) => ExchangeChartWidget(
                  list: snap,
                  graphColor: appStore.mSelectedGraphColor,
                ),
              );
            },
          ),
        ),
        16.height,
        HorizontalList(
          itemCount: timeChart.length,
          itemBuilder: (context, index) {
            bool isSelected = selected == index;
            return Observer(
              builder: (_) => AnimatedContainer(
                width: 56,
                padding: EdgeInsets.all(8),
                decoration: boxDecorationDefault(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: <Color>[appStore.mSelectedGraphColor.withOpacity(0.5), appStore.mSelectedGraphColor],
                          stops: <double>[0.03, 0.9],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight,
                        )
                      : LinearGradient(
                          colors: <Color>[context.cardColor, context.cardColor],
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

                if (index == 0) {
                  chartStore.setExchangeRangeDifference(30);
                } else if (index == 1) {
                  chartStore.setExchangeRangeDifference(7);
                } else if (index == 2) {
                  chartStore.setExchangeRangeDifference(1);
                } else if (index == 3) {
                  chartStore.setExchangeRangeDifference(90);
                } else if (index == 4) {
                  chartStore.setExchangeRangeDifference(180);
                } else if (index == 5) {
                  chartStore.setExchangeRangeDifference(365);
                }
                setState(() {});
              }, borderRadius: radius()),
            );
          },
        ),
      ],
    );
  }
}
