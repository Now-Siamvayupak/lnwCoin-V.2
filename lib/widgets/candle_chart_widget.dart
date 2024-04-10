import 'package:lnwcoin/model/candel_chart_model.dart';
import 'package:lnwcoin/utils/app_colors.dart';
import 'package:lnwcoin/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class CandleChartWidget extends StatelessWidget {
  List<CandleChartResponse> coinChart;
  ChartMarketType selectedChartType;
  Color? graphColor;

  CandleChartWidget({required this.coinChart, this.graphColor, this.selectedChartType = ChartMarketType.PRICES});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      legend: Legend(isVisible: false),
      series: getDefaultData2(),
      selectionType: SelectionType.series,
      trackballBehavior: TrackballBehavior(
        shouldAlwaysShow: false,
        activationMode: ActivationMode.singleTap,
        enable: true,
        tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
      ),
      primaryXAxis: CategoryAxis(
        interval: 1,
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(color: primaryColor, width: 0.0),
        isVisible: false,
      ),
      primaryYAxis: NumericAxis(
        labelStyle: primaryTextStyle(size: 12),
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(color: graphColor ?? themePrimaryColor, width: 1.0),
      ),
      enableAxisAnimation: true,
      zoomPanBehavior: ZoomPanBehavior(
        enableMouseWheelZooming: true,
        enablePinching: true,
        zoomMode: ZoomMode.xy,
        enablePanning: true,
      ),
      enableSideBySideSeriesPlacement: true,
      crosshairBehavior: CrosshairBehavior(enable: true, activationMode: ActivationMode.singleTap),
      /*axisLabelFormatter: (axisLabelRenderArgs) {
        return ChartAxisLabel(
            '${appStore.mSelectedCurrency!.symbol.validate()}${axisLabelRenderArgs.text.validate(value: 's').toInt().amountPrefix}',
            primaryTextStyle(size: 8));
      },*/
      borderColor: primaryColor,
      borderWidth: 0,
      plotAreaBorderWidth: 0,
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries> getDefaultData2() {
    List<CandleChartResponse> getChartData() {
      List<CandleChartResponse> chartData = [];

      Future.forEach(coinChart, (CandleChartResponse element) {
        chartData.add(element);
      });

      return chartData;
    }

    return <CartesianSeries>[
      CandleSeries<CandleChartResponse, int>(
          showIndicationForSameValues: true,
          bullColor: Colors.blue,
          dataSource: getChartData(),
          animationDuration: 1000,
          xValueMapper: (CandleChartResponse data, _) => data.time,
          highValueMapper: (CandleChartResponse data, _) => data.high,
          lowValueMapper: (CandleChartResponse data, _) => data.low,
          openValueMapper: (CandleChartResponse data, _) => data.open,
          closeValueMapper: (CandleChartResponse data, _) => data.close)
    ];
  }
}
